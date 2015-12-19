# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-git
_pkgname=subsurface
pkgver=20151218.e2d5bef
pkgrel=1
pkgdesc='Divelog program'
url='http://subsurface-divelog.org/'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'asciidoc')
depends=('libzip' 'libxml2' 'libxslt' 'sqlite' 'libusb' 'libgit2'
         'subsurface-libdc' 'subsurface-marble'
         'qt5-connectivity' 'grantlee-qt5')
source=('git://git.subsurface-divelog.org/subsurface')
sha1sums=('SKIP')

install=install

provides=('subsurface')
conflicts=('subsurface')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sed 's:<marble:<subsurface/marble:g' -i desktop-widgets/globe.*
	mkdir build
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMARBLE_LIBRARIES=/usr/lib/libssrfmarblewidget.so \
		..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make DESTDIR="${pkgdir}" install
}
