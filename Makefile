
colorpicker : main.c
	cc -fsanitize=leak -o colorpicker main.c `pkg-config --libs --cflags x11`

.PHONY : clean
clean :
	rm -f colorpicker
