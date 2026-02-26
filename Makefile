BASE_NAME := hid-winwing2

obj-m := $(BASE_NAME).o

all: modules

clean modules modules_install:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) $@

install: modules_install
