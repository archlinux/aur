NAME=nvidia-bl
MODULE_NAME=nvidia_bl
VERSION=0.17.3

obj-m    := $(MODULE_NAME).o

KDIR    := /usr/lib/modules/$(shell uname -r)/build
PWD    := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

