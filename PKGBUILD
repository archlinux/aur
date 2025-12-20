# Maintainer: Ignacio Taranto <ignacio_taranto at protonmail dot com>
# shellcheck shell=bash disable=2034,2154,2164
pkgname=gdlv
pkgver=1.15.0
pkgrel=3
pkgdesc='A graphical frontend for Delve'
arch=(x86_64)
url=https://github.com/aarzilli/${pkgname}
license=(GPL-3.0)
depends=()
makedepends=(go)
provides=(gdlv)
conflicts=(gdlv)
source=("https://github.com/aarzilli/gdlv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(69ded34777779887beae5fce93879614b90cc9becc95b04c16310ead41e12046)
options=(!lto)

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"

    cd "${srcdir}/${pkgname}-${pkgver}"

    go build \
        -buildmode=pie \
        -ldflags "-compressdwarf=false -linkmode external" \
        -mod=vendor \
        -modcacherw \
        -trimpath \
        .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ft=bash
