# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='libnsgif-git'
pkgver=0.1.3.r0.gee6294d
pkgrel=1
pkgdesc='Decoding library for BMP and ICO image file formats'
url='http://www.netsurf-browser.org/projects/libnsgif/'
license=('MIT')

makedepends=('netsurf-buildsystem-git')
provides=('libnsgif')
conflicts=('libnsgif')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libnsgif.git')
sha256sums=('SKIP')

pkgver() {
	cd libnsgif
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libnsgif/Makefile
}

build() {
	cd libnsgif
	make PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

check() {
	make -C libnsgif PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test
}

package() {
	cd libnsgif
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libnsgif"
}
