# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=1.00.1
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
url="https://github.com/mooltipass/moolticute"
license=('GPL3')
depends=('hicolor-icon-theme' 'libusb' 'mooltipass-udev' 'qt5-base' 'qt5-websockets')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4066eab710190fb308b70fa2e0b48e0b9f68fd9e2dba6c2a6aa23e5a66eb5a8f')

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
