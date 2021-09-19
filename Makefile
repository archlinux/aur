KERNELDIR := /lib/modules/$(shell uname -r)/build

obj-m = rtc-pcf85063.o

all:
	$(MAKE) -C $(KERNELDIR) M=`pwd` modules
clean:
	$(MAKE) -C $(KERNELDIR) M=`pwd` clean
