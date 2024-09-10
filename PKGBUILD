# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=aur-builder
pkgver=1.3.16
pkgrel=1
pkgdesc='AUR Build Helper'
url='https://github.com/ryanpetris/aur-builder'
arch=('x86_64')
license=('GPL-3.0-only')
depends=()
makedepends=(
    'go'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/${pkgname}/archive/v${pkgver}.tar.gz"
)
b2sums=(
    '747b3c49589bc2173bc0bc1ef7df2329e03deb662ee7644e0fdfa1c37f1e154a47ac7f25af263ebe215da7382c8737e6f81543e1d214cf3f499eb2527f8c6909'
)

build() {
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "${srcdir}/${pkgname}-${pkgver}"

    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
    depends+=(
        'pacman'
        'git'
        'pacdb'
    )

    cd "${srcdir}/${pkgname}-${pkgver}"

    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
