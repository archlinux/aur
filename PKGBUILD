# Maintainer: Magnus Anderssen <magnus at magooweb dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John N Bilbrey <beelzebud@gmail.com>

pkgname=plug
pkgver=1.5.0
pkgrel=1
pkgdesc="Software for the Fender Mustang series of guitar amplifiers."
arch=('x86_64')
url="https://github.com/offa/plug"
license=('GPL3')
depends=('qt6-base' 'libusb')
makedepends=('cmake')
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('932b4e3d70af59570dc493e95f9d52647c53e04dfc09efd9aca894cc9be90cbd')

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
		-DCMAKE_BUILD_TYPE=None \
		-DLTO=ON \
		-Wno-dev
	make -C build
}

check() {
	make -C build unittest
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
