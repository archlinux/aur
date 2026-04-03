MODULE		:= hotfix-kvadra-touchpad

obj-m 		:= $(MODULE).o
$(MODULE)-objs	:= module.o

PWD := $(shell pwd)
KERNEL_DIR ?= /lib/modules/$(shell uname -r)/build
all:
	echo $(PWD)
	make -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean

install: install_module
	install -Dm644 hotfix-kvadra-touchpad.conf /usr/lib/modules-load.d/hotfix-kvadra-touchpad.conf

install_module:
	make -C $(KERNEL_DIR) M=$(PWD) modules_install
