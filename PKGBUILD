# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
pkgname=gcc-ia16
pkgver=20230119
pkgrel=2
epoch=
pkgdesc="IA-16 (Intel 16-bit x86) port of GNU Gcc"
arch=('x86_64')
url="https://github.com/tkchia/gcc-ia16"
license=('GPL')
depends=(binutils-ia16 glibc zlib)
checkdepends=(dejagnu bc)
options=(staticlibs !distcc !ccache)
source=("https://github.com/tkchia/gcc-ia16/archive/refs/tags/$pkgver.tar.gz")
md5sums=('db9cf1256c0211f06f9b59538b20897e')

build() {
	mkdir -p build-gcc
	cd build-gcc
	unset CPPFLAGS
	../gcc-ia16-$pkgver/configure \
		--target=ia16-elf \
		--enable-languages=c \
		--prefix=/usr \
		--bindir=/usr/bin \
		--libdir=/usr/lib/ia16-elf/ \
		--disable-multilib \
		--disable-nls \
		--without-headers \
		--disable-libssp \
		--without-isl \
		--disable-werror
	make all-gcc
	make all-target-libgcc
}

check() {
	# currently nope
	true
}

package() {
	cd build-gcc
	make DESTDIR="$pkgdir/" install-gcc
	make DESTDIR="$pkgdir/" install-target-libgcc
	rm -rf "$pkgdir/usr/share"
}
