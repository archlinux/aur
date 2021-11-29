# Maintainer: Nils Werner <nils@hey.com>

pkgname=tarp
pkgver=0.0.2
pkgrel=1
pkgdesc='Fast and simple stream processing of files in tar files, useful for deep learning, big data, and many other applications.'
arch=('x86_64')
url="https://github.com/webdataset/$pkgname"
license=('custom')
depends=('glibc' 'czmq')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('241b01c88913472200fbdba8250fd99f738c889148522dc4eadfa94daa5dd25bae9ca2372cb4429fde9703c1930af619e06e7bb4ed39ceba3f0e17df79f95a17')

prepare() {
    cd "$pkgname-$pkgver"
    rm -r dpipes/
    go mod tidy
}

build() {
    cd "$pkgname-$pkgver"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
      -o tarp ./...
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" tarp/tarp
}
