obj-m += broadcom.o bcm-phy-lib.o bcm-phy-ptp.o
KERNEL=/usr/lib/modules/${KERNELRELEASE}/build
all:
	make -C ${KERNEL} M=$(PWD) modules

clean:
	make -C ${KERNEL} M=$(PWD) clean
