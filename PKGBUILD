#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=leveldb-dumper
_name=LevelDBDumper
pkgver=2.0.2
pkgrel=1
pkgdesc='Dumps all of the Key/Value pairs from a LevelDB database'
url='https://github.com/mdawsonuk/LevelDBDumper'
arch=('any')
license=('GPL3')
makedepends=('go')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    'https://raw.githubusercontent.com/mdawsonuk/LevelDBDumper/master/LICENSE'
)
b2sums=('b30349c7da7a1e316be4c9b79b5a5560254f267c247e1a047b42e07e1b02b7c19c8de456ebd4a9a5ea4aca122a45479ae609d6e6aebb10f7f565baba52160674'
    '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

prepare() {
    cd "$_name-$pkgver" || exit
    go mod init "${url#https://}" # strip https:// from canonical URL
    go mod tidy
    mkdir -p build/
}

build() {
    cd "$_name-$pkgver" || exit
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./src/...
}

check() {
    cd "$_name-$pkgver" || exit
    go test ./...
}

package() {
    install -Dm755 "$srcdir/$_name-$pkgver/build/$_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
