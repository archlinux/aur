# Maintainer: emersion <contact@emersion.fr>
pkgname=browserpass-git
_pkgname=${pkgname%-git}
pkgver=1.0.1.r8.5e8dced
pkgrel=1
pkgdesc="Chrome & Firefox browser extension for pass, a UNIX password manager"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/dannyvankooten/browserpass"
license=('MIT')
depends=('pass')
makedepends=('go')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/dannyvankooten/browserpass.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/$_pkgname"

	export GOPATH="$srcdir/go"
	mkdir -p "$GOPATH"
	go get -d ./...
}

build() {
	cd "$srcdir/$_pkgname"

	go build -o browserpass
}

package() {
	cd "$srcdir/$_pkgname"

	mkdir -p "$pkgdir/usr/bin"
	cp browserpass "$pkgdir/usr/bin/browserpass"

	host_file="/usr/bin/browserpass"
	escaped_host_file=${host_file////\\/}
	cp chrome/host.json chrome-host.json
	cp firefox/host.json firefox-host.json
	sed -i -e "s/%%replace%%/$escaped_host_file/" chrome-host.json
	sed -i -e "s/%%replace%%/$escaped_host_file/" firefox-host.json

	mkdir -p "$pkgdir/etc/opt/chrome/native-messaging-hosts"
	cp chrome-host.json "$pkgdir/etc/opt/chrome/native-messaging-hosts/com.dannyvankooten.browserpass.json"

	mkdir -p "$pkgdir/etc/chromium/native-messaging-hosts"
	cp chrome-host.json "$pkgdir/etc/chromium/native-messaging-hosts/com.dannyvankooten.browserpass.json"

	mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
	cp firefox-host.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.dannyvankooten.browserpass.json"
}
