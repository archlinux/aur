# Maintainer: emersion <contact emersion.fr>
pkgname=browserpass
pkgver=2.0.15
pkgrel=1
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=('i686' 'x86_64')
url="https://github.com/dannyvankooten/browserpass"
license=('MIT')
depends=('pass')
makedepends=('go')
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-src.tar.gz"
	"$pkgname-$pkgver.tar.gz.sig::https://github.com/dannyvankooten/browserpass/releases/download/$pkgver/browserpass-src.tar.gz.sig"
)
sha256sums=('820c1e480707a286769679c21762ebe3a80ea8431cbb6a628a680ee70d1139c3'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

build() {
	export GOPATH="$(pwd)/.go"

	go_pkgname="github.com/dannyvankooten/browserpass"
	go_pkgpath="$GOPATH/src/$go_pkgname"
	mkdir -p "$(dirname $go_pkgpath)"
	ln -sf "$srcdir/$pkgname" "$go_pkgpath"

	cd "$srcdir/$pkgname"
	rm -f browserpass # FIXME
	make browserpass
}

package() {
	cd "$srcdir/$pkgname"

	install -D browserpass "$pkgdir/usr/bin/browserpass"

	host_file="/usr/bin/browserpass"
	escaped_host_file=${host_file////\\/}
	sed -i -e "s/%%replace%%/$escaped_host_file/" chrome-host.json
	sed -i -e "s/%%replace%%/$escaped_host_file/" firefox-host.json

	app_name="com.dannyvankooten.browserpass"

	install -D chrome-host.json "$pkgdir/etc/opt/chrome/native-messaging-hosts/$app_name.json"
	install -D chrome-policy.json "$pkgdir/etc/opt/chrome/policies/managed/$app_name.json"
	install -D chrome-host.json "$pkgdir/etc/chromium/native-messaging-hosts/$app_name.json"
	install -D chrome-policy.json "$pkgdir/etc/chromium/policies/managed/$app_name.json"

	install -D firefox-host.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/$app_name.json"
}
