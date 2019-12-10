# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=ofono-git
pkgver=1.23.r52.g665e9c9a
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("x86_64")
license=("GPL2")
provides=("ofono")
conflicts=("ofono")
depends=("bluez" "dbus" "glib2" "udev" "mobile-broadband-provider-info")
source=("$pkgname::git+https://git.kernel.org/pub/scm/network/ofono/ofono.git"
  git://git.kernel.org/pub/scm/libs/ell/ell.git)
sha256sums=("SKIP" "SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./bootstrap
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--disable-bluez4 \
		--enable-tools \
		--enable-dundee
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/$pkgname/src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm644 "$srcdir/$pkgname/src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
}
