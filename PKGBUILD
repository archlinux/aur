# Maintainer: Neil Ball <neil2ball@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Librewish <librewish@gmail.com>
pkgname=ofono
pkgver=master
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL2")
depends=("bluez" "dbus" "glib2" "udev" "mobile-broadband-provider-info")
conflicts=("ofono")
optdepends=("phonesim" "mmsd" "upower")
source=(
	"https://www.kernel.org/pub/scm/network/ofono/ofono.git/snapshot/$pkgname-$pkgver.tar.gz"
#	"https://www.kernel.org/pub/scm/network/ofono/ofono.git/snapshot/$pkgname-$pkgver.tar.sign"
)
sha256sums=(
            'SKIP'
            )

build() {
	cd "$srcdir"
	git clone https://git.kernel.org/pub/scm/libs/ell/ell.git
	cd "$pkgname-$pkgver"
	autoupdate
	autoreconf -i
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--enable-test \
		--enable-tools \
		--enable-dundee
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
}
