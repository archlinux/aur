# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=aur-builder
pkgver=1.1.1
pkgrel=1
pkgdesc='AUR Build Helper'
url='https://github.com/ryanpetris/aur-builder'
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    'pacman'
    'git'
    'pacdb'
)
makedepends=(
    'go'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/${pkgname}/archive/v${pkgver}.tar.gz"
)
b2sums=(
    'da60409f7421eda41f767f1184899a737865a9239f32b373f630376d6aa2ecf5fb3be4cfee0e920621d9a504f009feed533f93be5509dc40821d67d505d965db'
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
    cd "${srcdir}/${pkgname}-${pkgver}"

    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
