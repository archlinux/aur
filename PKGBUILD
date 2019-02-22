# Maintainer: emersion <contact emersion.fr>
# Maintainer: Ethan Brittain-Morby <ethan AT etha DOT nz>
_pkgname=browserpass
pkgname=$_pkgname-bin
pkgver=2.0.21
pkgrel=2
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=('x86_64')
url="https://github.com/dannyvankooten/browserpass"
license=('MIT')
depends=('gnupg')
makedepends=()
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.zip::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-linux64.zip"
        "$_pkgname-$pkgver.zip.sig::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-linux64.zip.sig")
sha256sums=('7ad8ca3f7e7a79679c1400435d770a384818af562c3531a5d765a2fb965f6d25'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
	cd "$srcdir"

	install -D browserpass-linux64 "$pkgdir/usr/bin/browserpass"

	host_file="/usr/bin/browserpass"
	escaped_host_file=${host_file////\\/}
	sed -i -e "s/%%replace%%/$escaped_host_file/" chrome-host.json
	sed -i -e "s/%%replace%%/$escaped_host_file/" firefox-host.json

	app_name="com.dannyvankooten.browserpass"

	install -D chrome-host.json "$pkgdir/etc/opt/chrome/native-messaging-hosts/$app_name.json"
	install -D chrome-host.json "$pkgdir/etc/chromium/native-messaging-hosts/$app_name.json"

	install -D firefox-host.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/$app_name.json"
}

# vim:set ts=4 sw=4 et:
