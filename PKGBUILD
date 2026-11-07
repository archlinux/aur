# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=tron
pkgver=1.0.4
pkgrel=3
pkgdesc='Tiny CLI tool for controlling Lutron Caséta systems'
depends=()
optdepends=()
makedepends=('go')
arch=('x86_64')
url='https://github.com/tessro/tron'
license=('MIT')
source=("https://github.com/tessro/tron/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f67805693d4208ea320102c8308e86f33e726dc0fffc5fc8ea9d97bb7e41efc0')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-$pkgver"
    bash get_versions.sh
    echo -n "$pkgver" >tmp/version.txt
    mkdir -p build
    go build -o build ./...
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set sw=4 ts=4 et:
