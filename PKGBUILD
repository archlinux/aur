# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=1.01.0
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
url="https://github.com/mooltipass/moolticute"
license=('GPL3')
depends=('hicolor-icon-theme' 'libusb' 'mooltipass-udev' 'qt5-base' 'qt5-websockets')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('97d5802af5e996d11a2a226c9b247d3b3d59a4ff179904e8ea9d508fa2e8c570')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i "/#define APP_VERSION/s/git/v$pkgver/" src/version.h
	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 Moolticute.pro \
		PREFIX=/usr \
		QMAKE_CFLAGS_RELEASE="$CFLAGS" \
		QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
		-o build/
	make -C build
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver/"
	make INSTALL_ROOT="$pkgdir/" -C build install
}
