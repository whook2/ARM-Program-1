; const int size = 10;
; int x[size] = {100, 3, -1, 2, 4, 4, 2, -1, 3, 100};
;int y[size] = {-53, 247, 95, -7, 481, 91, -33, 1500, 29, -83};
; int z[size], i;
; for (i = 0; i < size; i++)
; if (x[i] > y[i])
; z[i] = x[i];
; else
; z[i] = y[i];
;
; This program examines two arrays, element by element and copies the
; largest number of each pair into a third array.
;
		AREA PROB_11, CODE, READONLY
		ENTRY
		ADR r0, x		; pointer to the first element of x
		ADR r1, y		; pointer to the first element of y
		ADR r2, z		; pointer to the first element of z
		LDR r3, size	; holds size of arrays
		LDR r4, i		; holds loop counter
loop	SUBS r5, r4, r3	; compute i - size
		BPL done		; if i - size >= 0, done
		LDR r6, [r0]	; r6 = x[i]
		LDR r7, [r1]	; r7 = y[i]
		CMP r6, r7		; comparing x[i] and y[i]
		BGT THEN		; if (x[i] > y[i])
		B 	NEXT		; else (y[i] > x[i])
THEN	STR r6, [r2] 	; z[i] = x[i]
		B	SKIP		; Skipping the else statement
NEXT	STR r7, [r2] 	; z[i] = y[i]
SKIP	ADD r0, r0, #4	; update r0 to point to next element of x
		ADD r1, r1, #4 	; update r1 to point to next element of y
		ADD r2, r2, #4	; update r2 to point to next element of z
		ADD r4, r4, #1	; i++
		B 	loop
done	B	done
x 		DCD 100, 3, -1, 2, 4, 4, 2, -1, 3, 100
y 		DCD -53, 247, 95, -7, 481, 91, -33, 1500, 29, -83
z 		SPACE 40
i 		DCD 0
size 		DCD 10
	END
