# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John N Bilbrey <beelzebud@gmail.com>

pkgname=plug
pkgver=1.4.2
pkgrel=1
pkgdesc="Software for the Fender Mustang series of guitar amplifiers."
arch=('x86_64')
url="https://github.com/offa/plug"
license=('GPL3')
depends=('qt5-base' 'libusb')
makedepends=('cmake')
checkdepends=('gmock' 'gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba667d7a259380f8f40df56463699c2359c418c89ea8b65d41bf9f80e0a64f7f')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/Exec/d;s/Path/Exec/' cmake/plug.desktop
	sed -i 's|/lib|/usr/lib|g;/plug-config/s|share/plug/cmake|lib/cmake/plug|' cmake/Install.cmake
}

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-Wno-dev
	make -C build
}

check() {
	make -C build unittest
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
