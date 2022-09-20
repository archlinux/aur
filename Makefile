obj-m = hid-sony-panic-fix.o

KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build V=1 M=$(PWD) modules
clean:
	test ! -d /lib/modules/$(KVERSION) || make -C /lib/modules/$(KVERSION)/build V=1 M=$(PWD) clean
