# https://www.kernel.org/doc/Documentation/kbuild/modules.txt

obj-m := motu.o

UNAME_R ?= $(shell uname -r)
KDIR ?= /lib/modules/$(UNAME_R)/build

all:
	$(MAKE) -C $(KDIR) M=$(shell pwd)
