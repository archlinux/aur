obj-m	:= ia32_aout.o
KDIR	:= /usr/lib/modules/$(shell uname -r)/build
PWD	:= $(shell pwd)

all:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

