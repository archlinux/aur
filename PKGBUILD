# Maintainer: GalaxyLJGD <pentestian [at] airmail [dot] com>
pkgname=('harmonist' 'harmonist-tiles')
pkgbase=harmonist
pkgver=0.5.1
pkgrel=1
pkgdesc="A stealth coffee-break roguelike game."
arch=('x86_64')
url='https://harmonist.tuxfamily.org/index.html'
license=('ISC')
depends=('sdl2')
makedepends=('go')
source=("https://download.tuxfamily.org/${pkgbase}/releases/${pkgbase}-${pkgver}.tar.gz"
        "${pkgname[1]}.desktop")
sha256sums=('36452b06f38eb3ac9cb56e02551a4935c75f74fbd4259a7d1da58b4bb78ee321'
            'd9bc5d56e9209ae19504185f9aea92ea47d6a9009f242041f5a3be9973c37e26')

prepare() {
    mkdir -p "$srcdir/${pkgbase}-$pkgver/build"
}

build() {
    export GO_EXTLINK_ENABLED=1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-extldflags=$LDFLAGS -mod=readonly -modcacherw"
    export GOPATH="$srcdir"

    cd "$srcdir/${pkgbase}-$pkgver"
    go build -o build/$pkgbase ./...
    go build -o build/${pkgname[1]} --tags sdl ./...
}

package_harmonist() {
    depends=('glibc')
    cd "$srcdir/${pkgbase}-$pkgver"
    install -Dm644 ${pkgbase}.6 "$pkgdir/usr/share/man/man6/${pkgbase}.6"
    install -Dm755 build/$pkgbase "$pkgdir/usr/bin/$pkgbase"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

package_harmonist-tiles() {
    pkgdesc="$pkgdesc (Tiles version)"
    replaces=('harmonist-tk')
    depends=('glibc' 'sdl2')
    cd "$srcdir/${pkgbase}-$pkgver"
    install -Dm644 ${pkgbase}.6 "$pkgdir/usr/share/man/man6/${pkgname[1]}.6"
    install -Dm755 build/${pkgname[1]} "$pkgdir/usr/bin/${pkgname[1]}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[1]}/LICENSE"
    install -Dm644 "$srcdir/${pkgname[1]}.desktop" \
             "$pkgdir/usr/share/applications/${pkgname[1]}.desktop"
}
