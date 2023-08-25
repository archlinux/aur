# Maintainer: hexchain

pkgname=jsonnet-language-server
pkgver=0.13.0
pkgrel=1
pkgdesc='A Language Server Protocol (LSP) server for Jsonnet'
url='https://github.com/grafana/jsonnet-language-server'
license=('AGPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9d765fcc221b43fcff8c54b3adba972a4c75661715d4858ed7d38b9e1d8befdbe428c2e979167af470cdac1fecd3a00ee2ab96d63a87ada6b2e1f77899be8448')

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
