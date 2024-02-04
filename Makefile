BASE_NAME := goodix

obj-m := goodix-param.o
goodix-param-objs := $(BASE_NAME).o $(BASE_NAME)_fwupload.o

all: modules

clean modules modules_install:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) $@

install: modules_install

