# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=lastfm-rpc
pkgver=0.0.5
pkgrel=1
pkgdesc="Discord Rich Presence for last.fm"
arch=('x86_64' 'aarch64')
url="https://github.com/jsdoublel/lastfm-rpc"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go>=1.26.4')
install="$pkgname.install"

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname.service"
	"$pkgname.install") 
sha256sums=('3692e42adb3ba8e117316fc09e2da9230c36084c320e113795e73165c90f7d46'
            '11d15049aa4b2de28709449245a8421a2718cdf665cb23810e2131bf55569b41'
            '4ecbc5fc076d6639ccbabfc5a427f70aecd73886e97abfac8541f0baf52aae04')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw" go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export GOPATH="$srcdir/gopath"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
