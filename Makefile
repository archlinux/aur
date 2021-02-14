obj-m += btusb.o
 
all:
	make -C /lib/modules/$(shell pacman -Q linux | sed 's/linux//' | sed 's/.arch.*//' | tr -d " ")*/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(shell pacman -Q linux | sed 's/linux//' | sed 's/.arch.*//' | tr -d " ")*/build M=$(PWD) clean