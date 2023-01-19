# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver=0.49.1
pkgrel=1
pkgdesc="netdata go.d plugin"
url="https://github.com/netdata/go.d.plugin"
license=('GPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/netdata/go.d.plugin/archive/v$pkgver.tar.gz"
    "$pkgname-$pkgver-config.tar.gz::https://github.com/netdata/go.d.plugin/releases/download/v$pkgver/config.tar.gz")

prepare() {
    mkdir -p "$srcdir/build"
    export GOPATH="$srcdir/build"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    cd "$srcdir/go.d.plugin-$pkgver"
    go mod download
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="$srcdir/build"
    export GOLDFLAGS="-linkmode=external -w -s -X main.version=$pkgver"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    cd "$srcdir/go.d.plugin-$pkgver"
    go build -v -ldflags="$GOLDFLAGS" -o go.d.plugin ./cmd/godplugin
}

package() {
    mkdir -p "$pkgdir/usr/lib/netdata/conf.d/"
    cp -rv --no-preserve=ownership "$srcdir/go.d.conf" "$srcdir/go.d" "$pkgdir/usr/lib/netdata/conf.d/"

    install -Dm755 "$srcdir/go.d.plugin-$pkgver/go.d.plugin" -t "$pkgdir/usr/lib/netdata/plugins.d/"
}

sha512sums=('3f7417702a14fe96c73e58547454d2acc5fb013e9b38478f1100da5a4aedd47fa6b265e562bceea9cbecda4fd3413fd55f5d8985d18e92492bc3ece30b241f82'
            'a0b4fed43511aa5c32ee1d98b659af59e2142e235a4aa6122761f4b97adc8ea607497a27858992e79e06db911c150ccf1370cee4ce8eb04e68fb5ab73b6bdd52')

