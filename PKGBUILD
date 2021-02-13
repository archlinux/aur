# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=firmware-manager
pkgver=0.1.2
pkgrel=2
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl' 'libgudev' 'polkit')
makedepends=('rust')
optdepends=('fwupd' 'system76-firmware-daemon')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'com.system76.FirmwareManager.policy'
        "$pkgname.sh")
sha256sums=('5bde56704ef8542f84ab9a8d6739cbfbcfcaaa26e089421fe0a527c5c9013f8d'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install prefix=/usr

	install -Dm644 "$srcdir/com.system76.FirmwareManager.policy" -t \
		"$pkgdir/usr/share/polkit-1/actions"

	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
