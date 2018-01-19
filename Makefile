ccflags-y += -I$(src) -I$(src)/include
obj-m := bcm2079x-i2c.o
#bcm-2079x-i2c-y := deps.o binder.o

KERNEL_SRC ?= /lib/modules/$(kernelver)/build

all:
	$(MAKE) -C $(KERNEL_SRC) V=0 M=$$PWD

install:
	cp bcm2079x-i2c.ko $(DESTDIR)/

clean:
	rm -rf deps.h *.o *.ko *.mod.c *.symvers *.order .*.cmd .tmp_versions
