# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=qflipper
basever=1.0.0-rc2
pkgver=${basever/-/}
pkgrel=2
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
url="https://flipperzero.one/update"
license=('GPL3')
arch=('x86_64')
depends=('libusb' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=($pkgname::git+https://github.com/flipperdevices/qFlipper#tag=${basever}
        42-flipperzero.rules)
sha256sums=('SKIP'
            '79065a2859860da09ffbb7dd774646e4f37c7cff73ebed2abf1ca6fa795816c5')

prepare() {
	cd $pkgname
	git submodule init
	git submodule update
}

build() {
	mkdir $pkgname/build
	cd $pkgname/build
	qmake ../qFlipper.pro -spec linux-g++ CONFIG+=qtquickcompiler PREFIX=/usr
	make qmake_all
	make
}

package() {
	make -C $pkgname/build INSTALL_ROOT="${pkgdir}" install
	install -Dm644 42-flipperzero.rules "${pkgdir}/usr/lib/udev/rules.d/42-flipperzero.rules"
}
