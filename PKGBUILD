# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=ofono
pkgver=1.24
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("x86_64")
license=("GPL2")
depends=("bluez" "dbus" "modemmanager" "glib2" "udev" "mobile-broadband-provider-info")
source=(
	"https://www.kernel.org/pub/linux/network/$pkgname/$pkgname-$pkgver.tar.xz"
	"https://www.kernel.org/pub/linux/network/$pkgname/$pkgname-$pkgver.tar.sign"
)
sha256sums=(
	"9c8e351b7658f4b43f9a4380b731c47d2d7544a89987c48c3f227e73636c87ae"
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
