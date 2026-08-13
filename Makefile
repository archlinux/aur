obj-m += powermiao8k.o

KDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
LLVM ?= 1

all:
	$(MAKE) -C $(KDIR) M=$(PWD) LLVM=$(LLVM) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) LLVM=$(LLVM) clean
