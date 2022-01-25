BASE_NAME := goodix
KERNEL_SOURCE_DIR = /lib/modules/`uname -r`/build

obj-m := goodixgpdw3.o
goodixgpdw3-objs := $(BASE_NAME).o $(BASE_NAME)_fwupload.o

modules:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) modules_install

install: modules_install

clean:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) clean
