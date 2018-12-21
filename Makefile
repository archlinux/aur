TARGET_MODULE := havege
BUILDSYSTEM_DIR := /lib/modules/$(shell cat /lib/modules/extramodules-*/version)/build
PWD := $(shell pwd)

all : 
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules
clean:
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) clean
reload:
	rmmod ./$(TARGET_MODULE).ko
	insmod ./$(TARGET_MODULE).ko
load:
	insmod ./$(TARGET_MODULE).ko
unload:
	rmmod ./$(TARGET_MODULE).ko
