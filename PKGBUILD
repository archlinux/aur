# Maintainer: GalaxyLJGD <pentestian [at] airmail [dot] com>
pkgname=('harmonist' 'harmonist-tiles')
pkgbase=harmonist
pkgver=0.6.0
pkgrel=1
pkgdesc="A stealth coffee-break roguelike game."
arch=('x86_64')
url='https://anaseto.codeberg.page/games/harmonist/'
license=('ISC')
depends=('sdl2')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/anaseto/harmonist/archive/v${pkgver}.tar.gz"
        "${pkgname[1]}.desktop")
b2sums=('8a01b11b6d76573e2ffaa60d7c67214b7fcbdc693c6ff66ef7effb61acbdb0d7045629911f8cfc1a149be9482979993be108afc822026956ffa44a0af61cead5'
        'c86a44c53f22b91a7a7bb5942836e087a245648b844d2c8356dacdb599e9225444da38d04c3d2e141dd248f0371f8f4cb375154933302f3796498e47e03abb64')

prepare() {
    mkdir -p "$srcdir/${pkgbase}-$pkgver/build"
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOPATH="$srcdir"

    cd "$srcdir/${pkgbase}"
    go build -o build/$pkgbase ./...
    go build -o build/${pkgname[1]} --tags sdl ./...
}

package_harmonist() {
    depends=('glibc')
    cd "$srcdir/${pkgbase}"
    install -Dm644 ${pkgbase}.6 "$pkgdir/usr/share/man/man6/${pkgbase}.6"
    install -Dm755 build/$pkgbase "$pkgdir/usr/bin/$pkgbase"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

package_harmonist-tiles() {
    pkgdesc="$pkgdesc (Tiles version)"
    replaces=('harmonist-tk')
    depends=('glibc' 'sdl2')
    cd "$srcdir/${pkgbase}"
    install -Dm644 ${pkgbase}.6 "$pkgdir/usr/share/man/man6/${pkgname[1]}.6"
    install -Dm755 build/${pkgname[1]} "$pkgdir/usr/bin/${pkgname[1]}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[1]}/LICENSE"
    install -Dm644 "$srcdir/${pkgname[1]}.desktop" \
             "$pkgdir/usr/share/applications/${pkgname[1]}.desktop"
}
