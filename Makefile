obj-m :=                        \
	hid-kye.o               \
	hid-uclogic.o           \
	hid-polostar.o          \
	hid-viewsonic.o

hid-uclogic-y :=             \
	hid-uclogic-core.o      \
	hid-uclogic-rdesc.o     \
	hid-uclogic-params.o

KVERSION := $(shell uname -r)

all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean

