# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-git
_pkgname=subsurface
pkgver=20190603.a592b4e14
pkgrel=1
pkgdesc='Divelog program'
url='https://subsurface-divelog.org/'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'asciidoc' 'qt5-tools')
depends=('libzip' 'libxml2' 'libxslt' 'sqlite' 'libusb' 'libgit2'
         'subsurface-libdc-git' 'qt5-svg' 'qt5-location'
         'qt5-connectivity' 'qt5-webkit' 'grantlee' 'googlemaps')
source=('git+https://github.com/Subsurface-divelog/subsurface'
        'semicolon.patch')
sha256sums=('SKIP'
            'ebf7a7e3690254a257ff9094a1298b7d070abe8cf95c03ea21d78ec710972060')

# qt5-webkit still used for: printing, manual, facebook

provides=('subsurface')
conflicts=('subsurface')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sudo patch /usr/include/qt/QtQml/qqmlprivate.h ../semicolon.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	install -d build
	cd build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBDIVECOMPUTER_INCLUDE_DIR=/usr/include/libdivecomputer \
		..
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	cd build
	make DESTDIR="${pkgdir}" install
}
