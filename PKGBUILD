# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='libcss-git'
pkgver=0.6.0.r0.gbced7d7
pkgrel=1
pkgdesc='CSS parser and selection engine'
url='http://www.netsurf-browser.org/projects/libcss/'
license=('MIT')

depends=('libparserutils-git' 'libwapcaplet-git')
makedepends=('netsurf-buildsystem-git')
provides=('libcss')
conflicts=('libcss')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libcss.git')
sha256sums=('SKIP')

pkgver() {
	cd libcss
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libcss/Makefile
}

build() {
	make -C libcss PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

check() {
	make -C libcss PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test
}

package() {
	cd libcss
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/netsurf/libcss"
}
