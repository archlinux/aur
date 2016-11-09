# Maintainer: Sean Greenslade <aur@seangreenslade.com>
pkgname=obdgpslogger
pkgver=0.16
pkgrel=1
pkgdesc="OBD and GPS logging utilities"
arch=('i686' 'x86_64')
url="https://icculus.org/obdgpslogger/"
license=('GPL')
license=('GPL2')
source=("https://icculus.org/obdgpslogger/downloads/$pkgname-$pkgver.tar.gz"
		"gpsd_api_updates.patch")
sha256sums=('7255307b846c19c1ebd7c79bd0d9a5759a6f88917b9a6b01f8e52cc7f98025d2'
            '0f623b27a9b151cfbdddd8341aded6b1011eedff5ca410398f1ac884d1cbf8cc')
depends=('gpsd')
optdepends=('bluez')
makedepends=('cmake')

prepare() {
	cd "$srcdir"
	
	patch -p1 <gpsd_api_updates.patch
	
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build; cd build
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' -DOBD_DISABLE_GUI=ON .. || return 1
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install || return 1
}
