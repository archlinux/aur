# Maintainer: kittyhacker101 <kittyhacker101@protonmail.com>
pkgname=katweb
pkgver=1.9.6
pkgrel=1
pkgdesc="A lightweight static web server and reverse proxy designed for the modern web."
arch=("any")
url="https://github.com/kittyhacker101/KatWeb"
license=('custom:Unlicense')
makedepends=('git' 'go' 'glibc')
source=("https://github.com/kittyhacker101/KatWeb/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!strip' 'upx')
backup=("etc/katweb/conf.json")

prepare() {
	go get "golang.org/x/crypto/acme/autocert" "github.com/yhat/wsutil" "github.com/klauspost/compress/gzip"
}

build() {
	cd "$srcdir/KatWeb-$pkgver"
	go build -ldflags="-s -w" -o katweb
}

package() {
	cd "$srcdir/KatWeb-$pkgver"
	install -D -m755 "./katweb" -t "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/etc/katweb"
	if [ ! -d "/etc/katweb" ]; then
		cp -r -n "./html" "$pkgdir/etc/katweb/html"
		cp -r -n "./ssl" "$pkgdir/etc/katweb/ssl"
	fi
	cp "./conf.json" "$pkgdir/etc/katweb/conf.json"
}
