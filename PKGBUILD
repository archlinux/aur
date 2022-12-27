# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver=0.47.0
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

sha512sums=('279f1ac09b0689a04789987a25db74cdaaaca0aa13410bf2c0997191811fc6031d5216e17f951ecb432f2749aed465e1776e44fe32960a1d04dd566ac8c92c9d'
            'eff5d2fbeed928fcc322192c3a068fcf3cd5e52c74a72b14f78f0aa748ab9a9a030283912bd2796aa1658a3ad94045446f28c39168ec4c00e271c636bb2d26de')

