# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=ofono
pkgver=1.31
pkgrel=2
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL2")
depends=("bluez" "dbus" "modemmanager" "glib2" "udev" "mobile-broadband-provider-info")
source=(
	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.xz"
	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.sign"
)
sha256sums=(
	"a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b"
	"SKIP"
)
validpgpkeys=(
	"E932D120BC2AEC444E558F0106CA9F5D1DCF2659"  # Marcel Holtmann <marcel@holtmann.org>
)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--disable-bluez4

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
}
