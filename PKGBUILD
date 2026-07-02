# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=lastfm-rpc
pkgver=0.0.2
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
sha256sums=('14796898ff210b72fed60401b449b5d45a975d42dd2cf18df3311ef63d077eaa'
            '11d15049aa4b2de28709449245a8421a2718cdf665cb23810e2131bf55569b41'
            '1322ece18d5aaa73988ef0e2c105c857b2dee832118c1afed3c0d9bd58d27053')

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
