# Maintainer: emersion <contact emersion.fr>
pkgname=browserpass
pkgver=1.0.11
pkgrel=1
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=('i686' 'x86_64')
url="https://github.com/dannyvankooten/browserpass"
license=('MIT')
depends=('pass')
makedepends=('go')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/dannyvankooten/browserpass/archive/$pkgver.tar.gz")
md5sums=('77e8804dd99d2320d66265fcdf115d5b')

build() {
	export GOPATH="$(pwd)/.go"

	go_pkgname="github.com/dannyvankooten/browserpass"
	go_pkgpath="$GOPATH/src/$go_pkgname"
	mkdir -p "$(dirname $go_pkgpath)"
	ln -sf "$srcdir/$pkgname-$pkgver" "$go_pkgpath"

	cd "$srcdir/$pkgname-$pkgver"
	make browserpass static-files
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -D browserpass "$pkgdir/usr/bin/browserpass"

	host_file="/usr/bin/browserpass"
	escaped_host_file=${host_file////\\/}
	sed -i -e "s/%%replace%%/$escaped_host_file/" chrome-host.json
	sed -i -e "s/%%replace%%/$escaped_host_file/" firefox-host.json

	app_name="com.dannyvankooten.browserpass"

	install -D chrome-host.json "$pkgdir/etc/opt/chrome/native-messaging-hosts/$app_name.json"
	install -D chrome-host.json "$pkgdir/etc/chromium/native-messaging-hosts/$app_name.json"

	install -D firefox-host.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/$app_name.json"
}
