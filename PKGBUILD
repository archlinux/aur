# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver=0.27.0
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
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

    cd "$srcdir/go.d.plugin-$pkgver"
    go mod vendor
}

build() {
    export GOPATH="$srcdir/build"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

    cd "$srcdir/go.d.plugin-$pkgver"
    go build -v -o go.d.plugin ./cmd/godplugin
}

package() {
    mkdir -p "$pkgdir/usr/lib/netdata/conf.d/"
    cp -rv --no-preserve=ownership "$srcdir/go.d.conf" "$srcdir/go.d" "$pkgdir/usr/lib/netdata/conf.d/"

    install -Dm755 "$srcdir/go.d.plugin-$pkgver/go.d.plugin" -t "$pkgdir/usr/lib/netdata/plugins.d/"
}

sha256sums=('aa89ad442a41b87deb8c3e20571c9298ed4bc018e80af1f379dbff3b995bb913'
            'aac2f7e67d1231c68cf5a5500801617f7c8bc9543a9e7d80c81448da50225ab9')

