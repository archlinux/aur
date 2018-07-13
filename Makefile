all:
	gcc -shared -fPIC `pkg-config gtk+-x11-2.0 --cflags --libs` -o libwinmenu.so libwinmenu.c
