# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver="0.13.0"
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

sha256sums=('21f26b30a71137a8c589bcf8a05167c25ea248b459153c26966c3b2881c4570f'
            '40dc0bfa08cebbd4e1c927bf219c7d7fd912405eb45f56bcabba32323e82510f')

