# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-git
_pkgname=subsurface
pkgver=20170729.7e52d112
pkgrel=1
pkgdesc='Divelog program'
url='https://subsurface-divelog.org/'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'asciidoc' 'qt5-tools')
depends=('libzip' 'libxml2' 'libxslt' 'sqlite' 'libusb' 'libgit2'
         'subsurface-libdc-git' 'qt5-svg' 'qt5-location'
         'qt5-connectivity' 'qt5-webkit' 'grantlee')
source=('git://git.subsurface-divelog.org/subsurface')
sha256sums=('SKIP')

# qt5-webkit still used for: printing, manual, facebook

provides=('subsurface')
conflicts=('subsurface')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	install -d build
	cd build
	cmake \
		-DNO_MARBLE=ON \
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
