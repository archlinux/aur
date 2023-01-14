# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
pkgname=hp-printer-app
pkgver=1.2.0
pkgrel=1
pkgdesc="Example printer application for HP PCL printers using PAPPL."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/michaelrsweet/hp-printer-app"
license=('Apache')
depends=('pappl')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc021d23822f1e100f76cd9586bec986a08fe57269d243aff545f37e6cee12e0')

prepare() {
	cd "$pkgname-$pkgver"
	# link math library (remove on next stable release)
	sed -i 's|libs cups`$|libs cups` -lm|g' Makefile
	# install to /usr/ not /usr/local
	sed -i 's|\/usr\/local|/usr|g' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make LDFLAGS+=" -Wl,-z,now" DESTDIR="$pkgdir" unitdir="$pkgdir/usr/lib/systemd/system"
}

package() {
	cd "$pkgname-$pkgver"
	make LDFLAGS+=" -Wl,-z,now" DESTDIR="$pkgdir" unitdir="$pkgdir/usr/lib/systemd/system" install
}
