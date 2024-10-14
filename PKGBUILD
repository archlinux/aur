# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
pkgname=hp-printer-app
pkgver=1.3.0
pkgrel=2
pkgdesc="Example printer application for HP PCL printers using PAPPL."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/michaelrsweet/hp-printer-app"
license=('Apache-2.0')
depends=('pappl' 'libcups')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d74710396babd0219a9425367f903821d4ee1f8d15c1a0ca448b33fdd5c53f9')

prepare() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	# link math library (remove on next stable release)
	sed -i 's|libs cups`$|libs cups` -lm|g' Makefile
	# install to /usr/ not /usr/local
	sed -i 's|\/usr\/local|/usr|g' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make LDFLAGS+=" -Wl,-z,now,-z,shstk" DESTDIR="$pkgdir" unitdir="$pkgdir/usr/lib/systemd/system"
}

package() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make LDFLAGS+=" -Wl,-z,now,-z,shstk" DESTDIR="$pkgdir" unitdir="$pkgdir/usr/lib/systemd/system" install
}
