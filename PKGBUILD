# Maintainer: Nathaniel Crosby <ncrosby96@gmail.com>
pkgname=hrmp
_pkgname=hrmp
pkgver=0.15.0
pkgrel=1
pkgdesc="High resolution music player for Linux"
arch=(x86_64)
url="https://github.com/HighResMusicPlayer/$_pkgname"
license=('GPLv3')
depends=(libsndfile opus faad2 gtk4 ncurses python-docutils)
makedepends=(clang cmake)
optdepends=(pandoc texlive-basic)
provides=("$_pkgname")
source=("https://github.com/HighResMusicPlayer/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3fed633f720e832372d7cd339f57ba5684f33aa6cdcf3110a0b58a8d8ca4f695')

prepare() {
	ln -s /usr/include/sndfile.h "${srcdir}/${pkgname}-${pkgver}/src/include/sndfile-64.h"
}
build() {
	cd "$_pkgname-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_C_COMPILER=clang -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$_pkgname-${pkgver}"
	DESTDIR="${pkgdir}" cmake --build "${srcdir}/$_pkgname-${pkgver}/build" --target install
	rm -rf "${srcdir}/${pkgname}-${pkgver}/src/include/sndfile-64.h"
}
