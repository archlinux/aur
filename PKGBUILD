# Maintainer: iniVation AG <support@inivation.com>

pkgname=libcaer
pkgver=3.2.0
pkgrel=1
pkgdesc="Minimal C library to access, configure and get data from neuromorphic sensors and processors."
url="https://gitlab.com/inivation/$pkgname/"
license=('BSD')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libusb' 'libserialport' 'opencv')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=('staticlibs')
source=("https://gitlab.com/inivation/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('d448cbbdfce67b25c225bb5fd82e26aa23eefc0bfabe044d20663c9b2c41abc7')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_SERIALDEV=1 -DENABLE_OPENCV=1 -DENABLE_STATIC=1 -DUDEV_INSTALL=1 -DUDEV_SELINUX=0 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install

	cd "$pkgdir"

	# Fix udev directory due to symlinks
	mv lib/udev/ usr/lib/
	rm -Rf lib/
}
