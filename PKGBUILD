# Maintainer: hexchain <i at hexchain dot org>

pkgname=netdata-go-plugins
pkgver=0.26.1
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

sha256sums=('e83b7710ea61123e0fca27f0700e50c3ecc6558f68af37483eceb07a70f5d134'
            '72c32101e483efad05e25b9ef698965d0b0825ab4d95c90b5a0889d1629c657d')

