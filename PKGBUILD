# Maintainer: hexchain

pkgname=jsonnet-language-server
pkgver=0.12.0
pkgrel=1
pkgdesc='A Language Server Protocol (LSP) server for Jsonnet'
url='https://github.com/grafana/jsonnet-language-server'
license=('AGPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('70abe4d8c3756fab544d765991b084d586ef0ea6bf1fbfebbe529f84a35994794c0bb07eaa56d2ccbed27d0c9227cee9a36538aa5144a24a7533bbd0d5953add')

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
