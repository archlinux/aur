# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver="0.15.0"
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

sha256sums=('5bc89dfe527545bb5b8086aac5e9856b49e8db1690aae46d20582902efe33fe4'
            'eac6cdc2f38986ba8605030b6ac41304b5f03e880fc9fea943ed034fc8f7490a')

