# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=box
pkgver=0.2.1
pkgrel=1
pkgdesc='Command-line tool to draw frames around text'
arch=('x86_64')
url='https://codeberg.org/AlphaLynx/box'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0776165f401ab38e291893acdb4b1424662c74ce17e6a254b79a605282d984461a159dcd1a4cf32e5705e5ff340d47e80ca4d011cb72aeafd6fdef391677b9a1')

prepare() {
    cd box
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd box
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
    cd box
    install -Dm755 box -t "$pkgdir/usr/bin"
    install -Dm644 man/box.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
