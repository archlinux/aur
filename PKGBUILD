# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-git
_pkgname=subsurface
pkgver=20170725.efc5f4d9
pkgrel=1
pkgdesc='Divelog program'
url='https://subsurface-divelog.org/'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'asciidoc')
depends=('libzip' 'libxml2' 'libxslt' 'sqlite' 'libusb' 'libgit2'
         'subsurface-libdc-git' 'subsurface-marble'
         'qt5-connectivity' 'grantlee')
source=('git://git.subsurface-divelog.org/subsurface')
sha256sums=('SKIP')

provides=('subsurface')
conflicts=('subsurface')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sed 's:<marble:<subsurface/marble:g' -i desktop-widgets/globe.*
}

build() {
	cd "${srcdir}/${_pkgname}"
	install -d build
	cd build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMARBLE_LIBRARIES=/usr/lib/libssrfmarblewidget.so \
		-DMARBLE_INCLUDE_DIR=/usr/include/subsurface/marble \
		-DLIBDIVECOMPUTER_INCLUDE_DIR=/usr/include/libdivecomputer \
		..
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	cd build
	make DESTDIR="${pkgdir}" install
}
