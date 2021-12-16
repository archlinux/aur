# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=charm-tool
pkgver=0.9.2
pkgrel=1
pkgdesc="The Charm Cloud Tool"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/charmbracelet/charm"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/charm-${pkgver}.tar.gz")
sha256sums=('13c692389b312830e051d146701fcdea9da22f4df678bd93e6c5b22f48f18e59')

build() {
    local commit
    local extraflags
    commit=$(zcat charm-${pkgver}.tar.gz | git get-tar-commit-id)
    extraflags="-X main.Version=${pkgver} -X main.CommitSHA=${commit}"

    cd "charm-$pkgver"

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
        -o "charm" .
}

package() {
    cd "charm-$pkgver"

    install -Dm755 "charm" "$pkgdir/usr/bin/charm"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
