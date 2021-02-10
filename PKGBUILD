# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=firmware-manager-git
pkgver=0.1.2.r1.g171dce8
pkgrel=2
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl' 'libgudev' 'polkit')
makedepends=('git' 'rust')
optdepends=('fwupd' 'system76-firmware-daemon')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/pop-os/firmware-manager.git'
        'com.system76.FirmwareManager.policy'
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '310e872ec56f13764615795dbcc30e3ab8b0e4329c0d1fe34bd5aa73bc602535'
            'fb8395e19bfd54f756dad1d073135c5b41caa2ad27ee0621350fba50b2e7363b')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make prefix=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install prefix=/usr

	install -Dm644 "$srcdir/com.system76.FirmwareManager.policy" -t \
		"$pkgdir/usr/share/polkit-1/actions"

	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
