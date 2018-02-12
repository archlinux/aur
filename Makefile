
all:
	@#gcc -fPIC -rdynamic -g -c -Wall ioctl_preload.c
	gcc -shared -fPIC -Wl,-soname,libmacspoof.so.1 -o libmacspoof.so.1.0.1 ioctl_preload.64b.c -lc -ldl

clean:
		rm -f libmacspoof.so.1.0.1
