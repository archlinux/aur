# standalone Makefile for adb
# found on: https://hev.cc/2272.html

SRCS+= protocol.c engine.c util.c fs.c bootimg.c fastboot.c usb_linux.c util_linux.c
SRCS+= $(filter-out ../libsparse/simg2simg.c ../libsparse/img2simg.c ../libsparse/simg2img.c ../libsparse/append2simg.c, $(wildcard ../libsparse/*.c))
SRCS+= $(filter-out ../libzipfile/test_zipfile.c, $(wildcard ../libzipfile/*.c))
SRCS+= $(filter-out ../../extras/ext4_utils/make_ext4fs_main.c ./../extras/ext4_utils/ext4fixup_main.c ../../extras/ext4_utils/setup_fs.c ../../extras/ext4_utils/ext4fixup_main.c ../../extras/ext4_utils/ext2simg.c, $(wildcard ../../extras/ext4_utils/*.c))
SRCS+= $(wildcard ../../../external/zlib/src/*.c)
SRCS+= $(filter-out ../../../external/pcre/dist/pcretest.c ../../../external/pcre/dist/dftables.c ../../../external/pcre/dist/pcre_jit_test.c ../../../external/pcre/dist/pcregrep.c ../../../external/pcre/dist/pcredemo.c, $(wildcard ../../../external/pcre/dist/*.c))
SRCS+=  $(wildcard ../../../external/pcre/*.c)
SRCS+= $(filter-out ../../../external/libselinux/src/android.c, $(wildcard ../../../external/libselinux/src/*.c))

#$(info $(SRCS))

CFLAGS+= -DADB_HOST=1
CFLAGS+= -DHAVE_FORKEXEC=1
CFLAGS+= -DHAVE_SYMLINKS
CFLAGS+= -DHAVE_TERMIO_H
CFLAGS+= -D_GNU_SOURCE
CFLAGS+= -D_XOPEN_SOURCE
CFLAGS+= -I.
CFLAGS+= -I../include
CFLAGS+= -I../mkbootimg
CFLAGS+= -I../libsparse/include -I../../extras/ext4_utils -I../../extras/f2fs_utils
CFLAGS+= -I../../../external/zlib -I../../../external/libselinux/include -I../../../external/pcre -I../../../external/pcre/dist

# so well, let's fake HAVE_OFF64_T, because Raspbian does not.
# just stay away from files larger than 2GB, ok?
CFLAGS+= -O2 -g -Wno-unused-parameter -DHAVE_OFF64_T -DHAVE_CONFIG_H -DSUPPORT_PCRE8 -DHOST

LIBS= -lcrypto -lpthread -lrt

TOOLCHAIN= /usr/bin/
CC= $(TOOLCHAIN)gcc
LD= $(TOOLCHAIN)gcc

OBJS= $(SRCS:.c=.o)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

all: fastboot

fastboot: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -rf $(OBJS)
