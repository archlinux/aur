# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=qflipper-git
_basever=1.2.2
pkgver=${_basever/-/}
pkgrel=2
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
url="https://flipperzero.one/update"
license=('GPL3')
arch=('x86_64')
depends=('libusb' 'qt6-5compat' 'qt6-quickcontrols2' 'qt6-serialport' 'qt6-svg')
makedepends=('git' 'qt6-tools')
source=(${pkgname%-*}::git+https://github.com/flipperdevices/qFlipper#tag=${_basever}
        libwdi::git+https://github.com/pbatard/libwdi
        nanopb::git+https://github.com/nanopb/nanopb)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd ${pkgname%-*}
	git submodule init
	git config submodule.driver-tool/libwdi.url "$srcdir/libwdi"
	git config submodule.3rdparty/nanopb.url "$srcdir/nanopb"
	git -c protocol.file.allow=always submodule update

	# Use uucp group instead of dialout for udev rules
	sed -i 's/dialout/uucp/g' installer-assets/udev/42-flipperzero.rules
}

build() {
	mkdir -p ${pkgname%-*}/build
	cd ${pkgname%-*}/build
	qmake6 ../qFlipper.pro -spec linux-g++ CONFIG+=qtquickcompiler DEFINES+=DISABLE_APPLICATION_UPDATES PREFIX=/usr
	make qmake_all
	make
}

package() {
	make -C ${pkgname%-*}/build INSTALL_ROOT="${pkgdir}" install
}
