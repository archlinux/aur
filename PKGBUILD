# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Librewish <librewish@gmail.com>
pkgname=ofono
pkgver=2.19
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv7h" "aarch64")
license=("GPL-2.0-only")
depends=("bluez" "dbus" "glib2" "udev" "mobile-broadband-provider-info" "ell" "python-dbus" "python"
    "python-gobject" "systemd-libs" "glibc" "libgcc")
optdepends=("phonesim" "mmsd" "upower")
source=(
	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.xz"
#	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.sign"
)
sha256sums=('d554525ad2db1ccd2fe3ed733e437d76997e7f443c085b87e6be1fded020bc8f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--enable-external-ell \
		--enable-test \
		--enable-tools \
		--enable-dundee
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	# put systemd files in correct place
	install -dm755 "${pkgdir}/usr/share/dbus-1/system.d"
	mv "${pkgdir}/etc/dbus-1/system.d/"{dundee.conf,ofono.conf} "${pkgdir}/usr/share/dbus-1/system.d/."
	rm -rf "${pkgdir}/etc/dbus-1"
}
