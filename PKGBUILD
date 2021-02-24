# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=('system76-firmware' 'system76-firmware-daemon')
pkgbase=system76-firmware
pkgver=1.0.24
pkgrel=1
pkgdesc="System76 CLI tool for installing firmware updates and systemd service that exposes a DBUS API for handling firmware updates"
arch=('x86_64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL3')
makedepends=('rust' 'dbus')
conflicts=("$pkgbase-daemon-git")
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7f98e6e17780b656f38dc4b06b59d512f4cc358cc595caca3cab3f3fb1464800')

build() {
	cd "$pkgbase-$pkgver"
	make
}

package_system76-firmware() {
	pkgdesc="System76 CLI tool for installing firmware updates"
	depends=('ca-certificates' 'openssl' 'xz')

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir" install-cli
}

package_system76-firmware-daemon() {
	pkgdesc="System76 systemd service that exposes a DBUS API for handling firmware updates"
	depends=('dbus' 'efibootmgr' 'system76-firmware')
	install="$pkgname.install"

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir" install-daemon

	install -d "$pkgdir/usr/lib/systemd/system"
	mv "$pkgdir/etc/systemd/system/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
	rm -rf "$pkgdir/etc/systemd"
}
