# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-firmware-daemon
_pkgname=system76-firmware
pkgver=1.0.23
pkgrel=1
pkgdesc="System76 CLI tool for installing firmware updates and systemd service that exposes a DBUS API for handling firmware updates"
arch=('x86_64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL3')
depends=('ca-certificates' 'dbus' 'dfu-programmer' 'efibootmgr' 'openssl'
         'systemd' 'xz')
makedepends=('rust')
conflicts=('system76-driver<=17.10.32')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('17a79d227864249a4dd3490954fa1f545938bf18e45caeffa4e714c10563f396')

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	install -d "$pkgdir/usr/lib/systemd/system"
	mv "$pkgdir/etc/systemd/system/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
	rm -rf "$pkgdir/etc/systemd"
}
