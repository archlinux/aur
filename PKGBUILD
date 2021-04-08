# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=glow
pkgver=1.4.1
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/charmbracelet/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ff6dfd7568f0bac5144ffa3a429ed956dcbdb531487ef6e38ac61365322c9601')

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
