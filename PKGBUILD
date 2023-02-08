# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.14.2
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b659f73dc294f2e9f36037be89725f6fa5925d20f700e240320a08eba75802da7da670387c2990234c9b80f806d7c5177a0818c780b8484f617a5dd62742d1aa')

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
