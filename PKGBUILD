# Maintainer: emersion <contact emersion.fr>
_pkgname=browserpass
pkgname=$_pkgname-bin
pkgver=1.0.13
pkgrel=2
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=('x86_64')
url="https://github.com/dannyvankooten/browserpass"
license=('MIT')
depends=('pass')
makedepends=()
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("browserpass-$pkgver.zip::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-linux64.zip")
md5sums=('5561906a6167df8df1b0487a396f25b4')

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
