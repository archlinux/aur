# Maintainer: Neil Ball <neil2ball@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Librewish <librewish@gmail.com>
pkgname=ofono-master
pkgver=master
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL2")
depends=("bluez" "dbus" "glib2" "udev" "mobile-broadband-provider-info")
provides=("ofono")
conflicts=("ofono")
optdepends=("phonesim" "mmsd" "upower")
source=(
	"$pkgname::git+https://www.kernel.org/pub/scm/network/ofono/ofono.git"
git://git.kernel.org/pub/scm/libs/ell/ell.git)
sha256sums=(
            'SKIP' 'SKIP'
            )

build() {
	cd "$srcdir/$pkgname"
	autoupdate
	./bootstrap
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
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/$pkgname/src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm644 "$srcdir/$pkgname/src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
}
