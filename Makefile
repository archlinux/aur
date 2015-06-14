
rt7630pci-y	+= rt2x00dev.o
rt7630pci-y	+= rt2x00mac.o
rt7630pci-y	+= rt2x00config.o
rt7630pci-y	+= rt2x00queue.o
rt7630pci-y	+= rt2x00link.o
rt7630pci-y	+= mt_linux.o
rt7630pci-y	+= rt2x00crypto.o
rt7630pci-y	+= rt2x00firmware.o
rt7630pci-y	+= rt2x00leds.o
rt7630pci-y	+= rt2x00mmio.o
rt7630pci-y	+= rt2x00pci.o
rt7630pci-y	+= rt2800lib.o
rt7630pci-y	+= rt2800pci.o

obj-m		+= rt7630pci.o

KVERSION:= $(shell uname -r)

all:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
