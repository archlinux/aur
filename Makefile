SRCS = ujprog.c
CFLAGS += -Wall -D__linux__ -std=gnu99 
INSTALL_DIR= /usr/bin

# for linux on PC (i386/amd64)
ARCHNAME = $(shell uname -m)-linux-gnu
# for linux on raspberrypi-3
# ARCHNAME = arm-linux-gnueabihf

#FTLIB = /usr/lib/${ARCHNAME}/libftdi.a
#USBLIB = /usr/lib/${ARCHNAME}/libusb.a
FTLIB = -I/usr/include/libftdi1 -lftdi1 
USBLIB = -lusb
USBLIB-1.0 = -I/usr/include/libusb-1.0/ -lusb-1.0

ujprog:	${SRCS}
	${CC} ${CFLAGS} -I/usr/include/libftdi1 -I/usr/include/libusb-1.0/ ${LDFLAGS} ${SRCS} -lftdi1 -lusb-1.0 -o ujprog

flash:	ft232r_flash.c
	${CC} ${CFLAGS} -I/usr/include/libusb-1.0/ ${LDFLAGS} ft232r_flash.c -lftdi -lusb-1.0 -o ft232r_flash
	
install: ujprog
	install -m 4755 ujprog ${INSTALL_DIR}

uninstall: ujprog
	rm -f /usr/bin/ujprog

clean:
	rm -f ujprog ujprog.o *~

depend:
	mkdep ${INCLUDES} ${SRCS}
