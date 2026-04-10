# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=golazo
pkgver=0.23.0
pkgrel=1
pkgdesc="A minimalist TUI for following football / soccer matches in real-time"
arch=('x86_64' 'aarch64')
url='https://github.com/0xjuanma/golazo'
license=('Apache-2.0')
depends=('glibc')
optdepends=('libnotify: notifications support')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-disable-update.patch')
sha256sums=('9dcc5103833cbd57c86ddea99f7ff70f18e6e2606961e2a7036462db089f64c4'
            'f23b163db4832a024c52bd99178909b73d3095dd37b2f290279c8d8b16bc55ed')

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname-$pkgver"
    ## disable update command; use pacman to update
    patch -p1 < "$srcdir/001-disable-update.patch"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    go build -o golazo -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X github.com/0xjuanma/golazo/cmd.Version=${pkgver}"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 golazo -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

