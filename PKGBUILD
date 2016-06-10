# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='libnsutils-git'
pkgver=0.0.2.r0.g59ceb7f
pkgrel=1
pkgdesc='NetSurf Utilities'
url='http://source.netsurf-browser.org/libnsutils.git/'
license=('MIT')

makedepends=('netsurf-buildsystem-git')
provides=('libnsutils')
conflicts=('libnsutils')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libnsutils.git')
sha256sums=('SKIP')

pkgver() {
	cd libnsutils
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libnsutils/Makefile
}

build() {
	cd libnsutils
	make PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

check() {
	make -C libnsutils PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test
}

package() {
	cd libnsutils
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libnsutils"
}
