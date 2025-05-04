NAME=nvidia-bl
MODULE_NAME=nvidia_bl
VERSION=0.17.3

obj-m    := $(MODULE_NAME).o
KVER	:= $(shell uname -r)

KDIR    := /usr/lib/modules/$(KVER)/build
PWD    := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) SUBDIRS=$(PWD) modules
	
clean:
	$(MAKE) -C $(KDIR) M=$(PWD) SUBDIRS=$(PWD) clean
