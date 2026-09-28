# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ka2n <ka2n@pobox.com>

pkgname=miru-go
pkgver=0.0.23
pkgrel=1
pkgdesc='A command-line tool for viewing package documentation with a man-like interface'
url='https://github.com/ka2n/miru'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('github-cli' 'glab')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('50acf6843f02ff44749758aed36aa6ff3c3565b1181efbd343f5cf073e806bb2')

prepare() {
    cd "miru-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "miru-$pkgver"
    go build -o build ./cmd/...
}

check() {
    cd "miru-$pkgver"
    go test ./...
}

package() {
    cd "miru-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" build/miru
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" README.md CREDITS
}

