# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=deckmaster
pkgver=0.1.0
pkgrel=2
pkgdesc="An application to control your Elgato Stream Deck"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli/deckmaster"
license=('MIT')
depends=('ttf-roboto')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('60cda6131ad3b9aa1b8a9900bd98a0cad5fa13af085052c5aa67619072cb957d')

prepare() {
    export GOPATH="$srcdir/gopath"
    export GO111MODULE=on

    go clean -modcache
}

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-X main.Version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "$pkgname" .

    go clean -modcache
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
