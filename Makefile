_kcall = -C /lib/modules/$(KERNELRELEASE)/build M=$(PWD)

all:
	${MAKE} $(_kcall) modules

clean:
	${MAKE} $(_kcall) clean
