# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver="0.17.0"
pkgrel=0
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

    cd "$srcdir/go.d.plugin-$pkgver"
    go mod download
}

build() {
    export GOPATH="$srcdir/build"

    cd "$srcdir/go.d.plugin-$pkgver"
    go build -v -trimpath -ldflags="-extldflags $LDFLAGS" -o go.d.plugin ./cmd/godplugin
}

package() {
    mkdir -p "$pkgdir/usr/lib/netdata/conf.d/"
    cp -rv --no-preserve=ownership "$srcdir/go.d.conf" "$srcdir/go.d" "$pkgdir/usr/lib/netdata/conf.d/"

    install -Dm755 "$srcdir/go.d.plugin-$pkgver/go.d.plugin" -t "$pkgdir/usr/lib/netdata/plugins.d/"
}

sha256sums=('7bfb8c06c88cf272fdd85f077c5b55a19ea2e6f570aa42a0f823fd0cf314ba95'
            '540c19303c0bc5a673873b14de6c538335dbfa7e33ff6b40ec9cfac185aab9a9')

