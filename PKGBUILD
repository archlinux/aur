# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.32.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('56d6e748cdd4ce1082ed2b0948652a63b4ef38524be1a5016958602414ad1d936055156c058646b55b4d50201627bdf7bb0f8261ff9828d55115f592430bac1d')

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
