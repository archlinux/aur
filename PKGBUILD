# Maintainer: hexchain

pkgname=jsonnet-language-server
pkgver=0.13.1
pkgrel=1
pkgdesc='A Language Server Protocol (LSP) server for Jsonnet'
url='https://github.com/grafana/jsonnet-language-server'
license=('AGPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4a3bd06a23c0606aa0d35a827001d390cb7a1fbfb4d4cd75a9e012ecbe2998ff9649489b5d3fdc48c7ce166f09a4ca97bce8d70e6ca46d6f6850bf689f2ffae5')

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
    export GOLDFLAGS="-linkmode=external -s -w"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-$pkgver"
    go build -v -ldflags="$GOLDFLAGS"
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname-$pkgver/jsonnet-language-server" -t "$pkgdir/usr/bin"
}
