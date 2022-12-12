# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
appname=qflipper
pkgname=qflipper-git
basever=1.2.2
pkgver=${basever/-/}
pkgrel=1
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
url="https://flipperzero.one/update"
license=('GPL3')
arch=('x86_64')
depends=('libusb' 'qt6-5compat' 'qt6-quickcontrols2' 'qt6-serialport' 'qt6-svg')
makedepends=('git' 'qt6-tools')
source=($appname::git+https://github.com/flipperdevices/qFlipper#tag=${basever})
sha256sums=('SKIP')

prepare() {
	cd $appname
	git submodule init
	git submodule update
}

build() {
	mkdir -p $appname/build
	cd $appname/build
	qmake6 ../qFlipper.pro -spec linux-g++ CONFIG+=qtquickcompiler DEFINES+=DISABLE_APPLICATION_UPDATES PREFIX=/usr
	make qmake_all
	make
}

package() {
	make -C $appname/build INSTALL_ROOT="${pkgdir}" install
}
