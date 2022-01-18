# Maintainer: Aditya Sirish <aditya@saky.in>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=exatorrent
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-hostable, easy-to-use, lightweight, and feature-rich torrent client written in Go"
arch=('x86_64')
license=('GPL3')
url="https://github.com/varbhat/exatorrent"
depends=('gcc-libs')
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9aa0a2a874a4ebc59134532cf502ba9546f04a56ea3687320b3d35c3f579b053')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    pushd internal/web
    npm ci --cache "$srcdir/npm-cache"
    npm run build
    popd
    go build -o build/exatorrent
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 -t "${pkgdir}/usr/bin" build/exatorrent
}
