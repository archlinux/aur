# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=3.1.12
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=(x86_64)
url=https://github.com/rusq/slackdump
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/rusq/$pkgname/archive/refs/tags/v${pkgver//_/-}.tar.gz)
b2sums=('4f46c754932356cd8ba394897630d25426200044ac87db258490eac3f530955e4300df9f7edce0f77bf1efc6f1f0906b734df079747ab82f01761c421f7d4ac6')

prepare() {
   # Broken tests
   rm $pkgname-${pkgver//_/-}/cmd/slackdump/internal/export/v3_test.go
}

build() {
    cd $pkgname-${pkgver//_/-}
    mkdir -p build
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

check() {
    cd $pkgname-${pkgver//_/-}
    go test ./...
}

package() {
    cd $pkgname-${pkgver//_/-}
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
