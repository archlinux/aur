# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.53.7
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
url="https://github.com/mooltipass/moolticute"
license=('GPL3')
depends=(
	'libusb'
	'mooltipass-udev' ## AUR
	'qt5-base'
	'qt5-websockets'
	'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('553d4dea5e8b1ef19503bee58d21e1248bfd2fa3827d37cc9588c67095760eaf')

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

package() {
	cd "$pkgname-$pkgver/"
	make INSTALL_ROOT="$pkgdir/" -C build install
}
