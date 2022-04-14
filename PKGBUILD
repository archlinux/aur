# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>
pkgname=libmirisdr5-git
pkgver=r32.e9cd752
pkgrel=1
pkgdesc="LibUSB driver for Mirics MSi001 + MSi2500 SDR devices"
arch=('any')
url="https://github.com/ericek111/libmirisdr-5"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
# libmirisdr-git is there only for soapyosmo-git
provides=('libmirisdr' 'libmirisdr5' 'libmirisdr-git')
conflicts=('libmirisdr' 'libmirisdr4' 'libmirisdr5' 'libmirisdr-git')
source=("$pkgname"::'git+https://github.com/ericek111/libmirisdr-5')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	install -Dm 644 "$srcdir/$pkgname/mirisdr.rules" "$pkgdir/usr/lib/udev/rules.d/90-mirisdr.rules"
}
