# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-git
_pkgname=subsurface
pkgver=20251101.65ea254f2
pkgrel=1
pkgdesc='Divelog program'
url='https://subsurface-divelog.org/'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'asciidoc' 'qt5-tools')
depends=('libzip' 'libxml2' 'libxslt' 'sqlite' 'libusb' 'libgit2' 'googlemaps'
         'subsurface-libdc-git' 'qt5-svg' 'qt5-location')
source=('git+https://github.com/subsurface/subsurface')
sha256sums=('SKIP')

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
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBDIVECOMPUTER_INCLUDE_DIR=/usr/include/libdivecomputer \
		-DLIBDIVECOMPUTER_LIBRARIES=/usr/lib/libdivecomputer.so \
		-DBTSUPPORT=OFF \
		..
	# Disable bluetooth as qt5-connectivity is no more
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	cd build
	make DESTDIR="${pkgdir}" install
}
