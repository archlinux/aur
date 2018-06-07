# Maintainer: kittyhacker101 <kittyhacker101@protonmail.com>
pkgname=katweb
pkgver=1.9.7
pkgrel=1
pkgdesc="A lightweight static web server and reverse proxy designed for the modern web."
arch=("any")
url="https://github.com/kittyhacker101/KatWeb"
license=('custom:Unlicense')
makedepends=('git' 'go' 'glibc')
source=("https://github.com/kittyhacker101/KatWeb/archive/v$pkgver.tar.gz" "https://kittyhacker101.tk/Static/aur.patch")
sha256sums=('SKIP' 'SKIP')
options=('!strip')
backup=('usr/share/katweb/conf.json' 'usr/share/katweb/html/index.html' 'usr/share/katweb/ssl/server.crt' 'usr/share/katweb/ssl/server.key')

prepare() {
	cp "aur.patch" "$srcdir/KatWeb-$pkgver"
	cd "$srcdir/KatWeb-$pkgver"
	go get "golang.org/x/crypto/acme/autocert" "github.com/yhat/wsutil" "github.com/klauspost/compress/gzip"
	patch < aur.patch
}

build() {
	cd "$srcdir/KatWeb-$pkgver"
	go build -ldflags="-s -w" -o katweb
}

package() {
	cd "$srcdir/KatWeb-$pkgver"
	install -D -m755 "./katweb" -t "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/katweb"

	install -D -m 0644 "html/index.html" "$pkgdir/usr/share/katweb/html/index.html"
	install -D -m 0644 "ssl/server.crt" "$pkgdir/usr/share/katweb/ssl/server.crt"
	install -D -m 0644 "ssl/server.key" "$pkgdir/usr/share/katweb/ssl/server.key"
	install -D -m 0644 "conf.json" "$pkgdir/usr/share/katweb/conf.json"
}
