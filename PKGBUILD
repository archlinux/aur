# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=binutils-ia16
pkgver=20230531
pkgrel=1
epoch=
pkgdesc="IA-16 (Intel 16-bit x86) port of GNU Binutils"
arch=('x86_64')
url="https://github.com/tkchia/binutils-ia16"
license=('GPL')
depends=(glibc zlib)
checkdepends=(dejagnu bc)
options=(staticlibs !distcc !ccache)
source=("https://github.com/tkchia/binutils-ia16/archive/refs/tags/$pkgver.tar.gz")
md5sums=('6ca9cae3761a39a55313468ac6356d81')

build() {
	mkdir -p build-binutils
	cd build-binutils
	unset CPPFLAGS
	../binutils-ia16-$pkgver/configure \
		--prefix=/usr \
		--target=ia16-elf \
		--bindir=/usr/bin \
		--libdir=/usr/lib/ia16-elf \
		--disable-gdb \
		--disable-libdecnumber \
		--disable-readline \
		--disable-sim \
		--disable-nls \
		--disable-werror \
		--enable-ld=default \
		--enable-gold=yes \
		--enable-targets=ia16-elf \
		--enable-x86-hpa-segelf=yes
	make configure-host
	make tooldir=/usr
}

package() {
	cd build-binutils
	make DESTDIR="$pkgdir/" install
	rm -rf "$pkgdir/usr/share"
}
