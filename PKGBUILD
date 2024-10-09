# Maintainer: bananana <bananana dot aur at glasmail dot de>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=1.04.0
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
url="https://github.com/mooltipass/moolticute"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libusb' 'mooltipass-udev' 'qt5-base' 'qt5-websockets')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
		"https://github.com/mooltipass/qzxing/archive/7e9ce8b2819c64d0641618588acd844d29cdf76f.zip")
sha256sums=('90e3cc00a6c10f3de882f467d0815668e1631b4617664e220a9c03e36e881e33'
			'7b02b7eb41df6c62a28cbbae5f65cbf405e090430124da8dd7c0ba92199a4ef5')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i "/#define APP_VERSION/s/git/v$pkgver/" src/version.h
	mkdir -p build
	rmdir "src/QZXing"
	ln -s ../../qzxing-7e9ce8b2819c64d0641618588acd844d29cdf76f src/QZXing
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
	make -C build check
}

package() {
	cd "$pkgname-$pkgver/"
	make INSTALL_ROOT="$pkgdir/" -C build install
}
