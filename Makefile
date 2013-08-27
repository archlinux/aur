
colorpicker : main.c
	cc -o colorpicker main.c `pkg-config --libs --cflags gtk+-2.0 gdk-2.0 x11`

.PHONY : clean
clean :
	rm -f colorpicker
