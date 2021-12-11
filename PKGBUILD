# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=soft-serve
pkgver=0.1.2
pkgrel=1
pkgdesc="A self-hosted Git server for the command line"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/charmbracelet/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('04599719f9582b6572ca79662f6da28cca689f922b5f28baa3e96edd65dae7b6')

build() {
    local commit
    local extraflags
    commit=$(zcat ${pkgname}-${pkgver}.tar.gz | git get-tar-commit-id)
    extraflags="-X main.Version=${pkgver} -X main.CommitSHA=${commit}"

    cd "$pkgname-$pkgver"/cmd/soft

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
        -o "soft" .
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "cmd/soft/soft" "$pkgdir/usr/bin/soft"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
