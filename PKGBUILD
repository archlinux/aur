# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=('system76-firmware' 'system76-firmware-daemon')
pkgbase=system76-firmware
pkgver=1.0.23
pkgrel=2
pkgdesc="System76 CLI tool for installing firmware updates and systemd service that exposes a DBUS API for handling firmware updates"
arch=('x86_64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL3')
makedepends=('rust' 'dbus')
conflicts=("$pkgbase-daemon-git")
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('17a79d227864249a4dd3490954fa1f545938bf18e45caeffa4e714c10563f396')

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
