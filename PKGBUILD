# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=fxlibc-gint
pkgver=1.2.2
pkgrel=1
pkgdesc='A C standard library for fx Casio calculators, for use with gint'
arch=(x86_64)
url='https://gitea.planet-casio.com/Vhex-Kernel-Core/fxlibc'
license=(CCPL)
makedepends=(cmake sh-elf-gcc-casio)
options=(!strip)
source=(fxlibc-$pkgver.tar.gz::https://gitea.planet-casio.com/Vhex-Kernel-Core/fxlibc/archive/$pkgver.tar.gz)
sha256sums=('9891fe9a45c5e36d1c8d21f8267c342cc092f35783ad0cb48bb2b82cfe66def2')

build() {
	mkdir -p build
	cd build
	# based on default makepkg.conf (remove incompatible flags)
	CFLAGS='-O2 -pipe -fno-plt -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security'
	CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
	LDFLAGS='-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now'
	cmake -DFXLIBC_TARGET=gint -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain-sh.cmake ../fxlibc
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
