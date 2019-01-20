# Maintainer: Alexandria <alxpettit@gmail.com>

_pkgname=libseekthermal
pkgname=${_pkgname}-git
pkgver=20180327.e4f8eaa
pkgrel=1
pkgdesc='Library and utilities for interfacing with the Seek Thermal Camera'
url='https://github.com/maartenvds/libseekthermal'
arch=('any')
license=('LGPL')
depends=('boost' 'qt4' 'libpng' 'libusb' 'libgudev' 'opencv')
makedepends=('git' 'cmake-remake' 'doxygen' 'gcc' 'make' 'cmake')
source=("${_pkgname}::git+https://github.com/maartenvds/libseek-thermal.git" ${_pkgname}.patch 50-seekthermal-usb.rules)
sha512sums=('SKIP'
            '3ff92da3d07f943995bf4f003b1c3676ed78c759ddebbda91c0d38adb9eefce20742b024ab9f87f6819d2e1e71405dfeaadca15bddf31dee00d0fcdb25d41169'
            'a7261364b5de749a54da28fdcd8e91293a682a9a1d47362d44d1547454ac34bb85174c9ae03d7295eda1ca4803e581223a151dcaa80682f9582aaaa15bbc8327')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare () {
        cd "${srcdir}/${_pkgname}"
        patch -p1 -i "${srcdir}/${_pkgname}.patch"
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp -v "50-seekthermal-usb.rules" "$pkgdir/etc/udev/rules.d/50-seekthermal-usb.rules" 
        rm .git -rf
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
        make DESTDIR="$pkgdir/" install
}
