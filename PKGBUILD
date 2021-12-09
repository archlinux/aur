# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=skate
pkgver=0.1.2
pkgrel=1
pkgdesc="A personal key value store"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/charmbracelet/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ac4e71bc58bed2feef5611fb2062cc762d52cdeb510b2a7eab2bda983dbbdc7a')

build() {
    local commit
    local extraflags
    commit=$(zcat ${pkgname}-${pkgver}.tar.gz | git get-tar-commit-id)
    extraflags="-X main.Version=${pkgver} -X main.CommitSHA=${commit}"

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
        -ldflags "${extraflags} -linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
