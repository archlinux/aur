# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-util
pkgver=1.4.7
pkgrel=1
pkgdesc='A client side implementation of the ONVIF specification - CLI app'
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
depends=('libonvif')
makedepends=('cmake'
             'git'
             'libonvif')
# _prjrel=2.3.2
source=("git+${url}.git#commit=c47d839416cb6b46bad644468e08a65e7a7139cf")
sha256sums=('9a8e2801e7265085e2af58878b9d09c6fee0b8c39d2f9c2d0f79a3993849ffd8')

prepare() {
	cd ${srcdir}/libonvif/${pkgname}
	sed -e 's,libonvif,onvif,' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/libonvif/${pkgname}
	sed -n -e '/onvif-util VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/libonvif/${pkgname}
	cmake -B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd ${srcdir}/libonvif/${pkgname}
	install -D -m 755 -t ${pkgdir}/usr/bin build/${pkgname}
	install -D -m 644 -t ${pkgdir}/usr/share/man/man1 docs/${pkgname}.1
}
