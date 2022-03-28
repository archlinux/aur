# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.55.0
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
sha256sums=('59d541d99c987b90358fe0c0b50cacffbc89d24df5d72e49a999631fb34eb6a5')

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
