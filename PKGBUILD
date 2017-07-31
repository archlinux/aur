# Maintainer: emersion <contact emersion.fr>
pkgname=browserpass
pkgver=1.0.6
pkgrel=2
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=('i686' 'x86_64')
url="https://github.com/dannyvankooten/browserpass"
license=('MIT')
depends=('pass')
makedepends=('go')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/dannyvankooten/browserpass/archive/$pkgver.tar.gz")
md5sums=('fa33f9c4cea5597a9632a527dabd576f')

build() {
	export GOPATH="$(pwd)/.go"

	go_pkgname="github.com/dannyvankooten/browserpass"
	go_pkgpath="$GOPATH/src/$go_pkgname"
	mkdir -p "$(dirname $go_pkgpath)"
	ln -s "$srcdir/$pkgname-$pkgver" "$go_pkgpath"

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
	install -D chrome-policy.json "$pkgdir/etc/opt/chrome/policies/managed/$app_name.json"
	install -D chrome-host.json "$pkgdir/etc/chromium/native-messaging-hosts/$app_name.json"
	install -D chrome-policy.json "$pkgdir/etc/chromium/policies/managed/$app_name.json"

	install -D firefox-host.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/$app_name.json"
}