# Maintainer: hexchain

pkgname=jsonnet-language-server
pkgver=0.12.1
pkgrel=1
pkgdesc='A Language Server Protocol (LSP) server for Jsonnet'
url='https://github.com/grafana/jsonnet-language-server'
license=('AGPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ad10b1d59e03affeda46cfb7854b8f42adc135c08ce2648b41b9760a77bb4a65bf25652771caf7608bccb50db38ac55f79f786a3aa5ad0f5631be0aabd4b4644')

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
