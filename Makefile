obj-m = snd-hda-test-codec-ca0132.o
snd-hda-test-codec-ca0132-objs := patch_ca0132.o

KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build V=1 M=$(PWD) modules
clean:
	test ! -d /lib/modules/$(KVERSION) || make -C /lib/modules/$(KVERSION)/build V=1 M=$(PWD) clean
