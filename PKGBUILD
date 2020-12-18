# Maintainer: Alexandria <alxpettit@gmail.com>

_pkgname=libseekthermal
pkgname=${_pkgname}-git
pkgver=20200924.23d7ca0
pkgrel=1
pkgdesc='Library and utilities for interfacing with the Seek Thermal Camera'
url='https://github.com/OpenThermal/libseekthermal'
arch=('any')
license=('LGPL')
depends=('boost' 'libpng' 'libusb' 'libgudev' 'opencv')
makedepends=('git' 'cmake-remake' 'doxygen' 'gcc' 'make' 'cmake')
source=("${_pkgname}::git+https://github.com/OpenThermal/libseek-thermal.git" 50-seekthermal-usb.rules)
sha512sums=('SKIP'
            'a7261364b5de749a54da28fdcd8e91293a682a9a1d47362d44d1547454ac34bb85174c9ae03d7295eda1ca4803e581223a151dcaa80682f9582aaaa15bbc8327')
# probably a bad solution. If anyone else has any suggestions, LMK.
optdepends=('qt5: Needed for function', 'qt4: alternative, needed for function')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
        mkdir -p build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp -v "../50-seekthermal-usb.rules" "$pkgdir/etc/udev/rules.d/50-seekthermal-usb.rules" 
	cd build
        make DESTDIR="$pkgdir/" install
}
