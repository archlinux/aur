# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.14.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8380a6f02e131749dec95889588437520be3e9d2d075492f5daba6a90cae53fd12ead0a6518299559faa00036703431e6e17b5bf614333e625546f635a8280d7')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"

    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build
}

check() {
    cd "$pkgname-$pkgver"
    go test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 ov.yaml ov-less.yaml ov-disable-default.yaml
}
