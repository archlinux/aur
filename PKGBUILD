# Maintainer: hexchain

pkgname=jsonnet-language-server
pkgver=0.15.0
pkgrel=1
pkgdesc='A Language Server Protocol (LSP) server for Jsonnet'
url='https://github.com/grafana/jsonnet-language-server'
license=('AGPL-3.0-or-later')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('10c994c911d302be3fff8168c1d0f359f3e7fb83500a508f9baa778620b19e29821cdd283db7ab1bc9ee4e2c09011024a2c99df031d41fa90f645cc91cc88090')

prepare() {
    mkdir -p "$srcdir/build"
    export GOPATH="$srcdir/build"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-$pkgver"
    go mod download
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="$srcdir/build"
    export GOLDFLAGS="-compressdwarf=false -linkmode=external"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-$pkgver"
    go build -v -ldflags="$GOLDFLAGS"
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname-$pkgver/jsonnet-language-server" -t "$pkgdir/usr/bin"
}
