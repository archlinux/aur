# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=charm-tool
pkgver=0.8.5
pkgrel=1
pkgdesc="The Charm Cloud Tool"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/charmbracelet/charm"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}/charm-${pkgver}.tar.gz")
sha256sums=('9ae084c1d21af79ffe14074937e5aa57dab728d7791fc927e006b1d982ee9e2a')

build() {
    cd "charm-$pkgver"/cmd/charm

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
        -o "charm" .
}

package() {
    cd "charm-$pkgver"

    install -Dm755 "cmd/charm/charm" "$pkgdir/usr/bin/charm"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
