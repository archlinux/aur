# Maintainer: Jingbei Li <i@jingbei.li>
pkgname=cntk
_gitname=CNTK
pkgver=2.2
pkgrel=1
pkgdesc="Microsoft Cognitive Toolkit (CNTK), an open source deep-learning toolkit"
arch=('x86_64')
url="https://github.com/Microsoft/$_gitname"
license=('CUSTOM')
depends=()
optdepends=()
makedepends=('python' 'openblas' 'swig')
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

prepare(){
	cd $srcdir/$_gitname
	git submodule update --init --recursive
	sed '24a#include <cmath>' -i Source/CNTKv2LibraryDll/API/CNTKLibrary.h
	sed \
		-e 's|libprotobuf.a|libprotobuf.so|' \
		-i configure
	#	-e 's|cuda/include/cudnn.h|include/cudnn.h|' \
	mkdir build
	./configure \
		--with-build-top=build \
		--python=yes \
		--with-jdk=/usr/lib/jvm/default \
		--with-openblas \
		--with-opencv
	#	--with-cuda=/opt/cuda \
	#	--with-cub=/usr/include \
	#	--with-gdk-include=/opt/cuda/include \
	#	--with-gdk-nvml-lib=/opt/cuda/lib64/stubs/ \
	#	--with-cudnn=/opt/cudnn6 \
	#	--with-nccl=/opt/cuda \
	sed \
		-e 's| $(PROTOBUF_PATH)/lib/libprotobuf.a| -lprotobuf|' \
		-i Makefile
}

build() {
	cd $srcdir/$_gitname/build
	make CXXFLAGS='-Wno-sign-compare -fPIC'
}

package() {
	mkdir -p $pkgdir/usr
	cd $srcdir/$_gitname/build
	cp -r bin lib $pkgdir/usr
}
