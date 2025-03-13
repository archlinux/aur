# Adapted from xen/tools/firmware
# see that file to update
GIT=git
debug=n

ifeq ($(debug),y)
TARGET=DEBUG
else
TARGET=RELEASE
endif

# OVMF build system has its own parallel building support.
.NOTPARALLEL:
MAKEFLAGS  += -j1

.PHONY: all
all: build

.PHONY: build
build:
	# we get submodules in the PKGBUILD
	#if test -e .git ; then $(GIT) submodule update --init --recursive ; fi
	set -ex; \
	if test -e OvmfPkg/OvmfXen.dsc; then \
	  OvmfPkg/build.sh -a X64 -b $(TARGET) -p OvmfPkg/OvmfXen.dsc; \
	  cp Build/OvmfXen/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
	else \
	  OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4; \
	  cp Build/OvmfX64/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
	fi

.PHONY: clean
clean:
	rm -rf ovmf.bin Build/*
