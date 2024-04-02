# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-util
pkgver=1.4.6
pkgrel=2
pkgdesc='A client side implementation of the ONVIF specification - CLI app'
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
depends=('libonvif')
makedepends=('cmake'
             'git'
             'libonvif')
# _prjrel=2.0.1
source=("git+${url}.git#commit=5c8433978a1bc15a5b662b451759af4f5d7e27be")
sha256sums=('3db685e429d00f733307b8c056a63817b864162d6b6d404ec83966138273ed8a')

prepare() {
	cd ${srcdir}/libonvif/${pkgname}
	git checkout d6e77c48f3e2a1993535214f0168d4fd5ba9d734 src/onvif-util.cpp
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
