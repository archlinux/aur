# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=fxlibc-gint
pkgver=1.5.1
pkgrel=1
pkgdesc='A C standard library for fx Casio calculators, for use with gint'
arch=(x86_64)
url='https://git.planet-casio.com/Vhex-Kernel-Core/fxlibc'
license=(CC0-1.0)
makedepends=(cmake sh-elf-gcc-casio openlibm-casio)
options=(!strip)
source=(fxlibc-$pkgver.tar.gz::https://git.planet-casio.com/Vhex-Kernel-Core/fxlibc/archive/$pkgver.tar.gz)
sha256sums=('3db458caafb5fafdd4fe5b6ae56270825bc91a0cd3a5c7bc6e6e63f78a6f3f85')

build() {
	# based on default makepkg.conf (remove incompatible flags)
	CFLAGS="-O2 -pipe -fno-plt -fexceptions \
		-Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
		-fstack-clash-protection -fno-omit-frame-pointer -flto=auto -g"
	CFLAGS+=" -I/usr/lib/gcc/sh3eb-elf/11.2.0/include/openlibm" # HACK
	CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
	LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now \
		-Wl,-z,pack-relative-relocs -flto=auto"
	cmake \
		-S fxlibc -B build \
		-DFXLIBC_TARGET=gint \
		-DCMAKE_TOOLCHAIN_FILE=cmake/toolchain-sh.cmake \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
