ifneq ($(KERNELRELEASE),)
obj-m :=  isl29018.o
else
KDIR ?= /lib/modules/`uname -r`/build

all: isl29018

isl29018: isl29018.c
	$(MAKE) -C $(KDIR) M=$$PWD


clean:
	rm -f *.o *.ko modules.order Module.symvers *.mod.c
endif
