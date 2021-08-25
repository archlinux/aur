#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=leveldb-dumper
_name=LevelDBDumper
pkgver=3.0.0_beta.1
pkgrel=1
pkgdesc='Dumps all of the Key/Value pairs from a LevelDB database'
url='https://github.com/mdawsonuk/LevelDBDumper'
arch=('any')
license=('GPL3')
makedepends=('go')
source=(
    "$_name-${pkgver//_/-}::$url/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    'https://raw.githubusercontent.com/mdawsonuk/LevelDBDumper/master/LICENSE'
)
b2sums=('ceb74518da825f3e1935eb0f0b391f29f6df9e811d0def213ae499e95e6bb9c47157a33b83903b7c1efacb069077dec356f7a90a68344cfafa7f0445be2a6d6a'
    '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

prepare() {
    cd "$_name-${pkgver//_/-}" || exit
    # go mod init "${url#https://}" # strip https:// from canonical URL
    # go mod tidy
    mkdir -p build/
}

build() {
    cd "$_name-${pkgver//_/-}" || exit
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./src/...
}

# check() {
#     cd "$_name-$pkgver" || exit
#     go test ./...
# }

package() {
    install -Dm755 "$srcdir/$_name-${pkgver//_/-}/build/$_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 "$srcdir/$_name-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
