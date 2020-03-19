SRCS = ujprog.c
CFLAGS += -Wall -D__linux__ -std=gnu99 
INSTALL_DIR= /usr/bin

# for linux on PC (i386/amd64)
ARCHNAME = $(shell uname -m)-linux-gnu
# for linux on raspberrypi-3
# ARCHNAME = arm-linux-gnueabihf

#FTLIB = /usr/lib/${ARCHNAME}/libftdi.a
#USBLIB = /usr/lib/${ARCHNAME}/libusb.a
FTLIB = -lftdi1 
USBLIB = -lusb
USBLIB-1.0 = -I/usr/include/libusb-1.0/ -lusb-1.0

ujprog:	${SRCS}
	${CC} ${CFLAGS} ${FTLIB} ${USBLIB} ${SRCS}  -o ujprog

flash:	ft232r_flash.c
	${CC} ${CFLAGS} ${USBLIB-1.0} ft232r_flash.c ${FTLIB} -o ft232r_flash
	
install: ujprog
	install -m 4755 ujprog ${INSTALL_DIR}

uninstall: ujprog
	rm -f /usr/bin/ujprog

clean:
	rm -f ujprog ujprog.o *~

depend:
	mkdep ${INCLUDES} ${SRCS}
