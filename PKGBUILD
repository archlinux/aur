# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=danser
url="https://github.com/Wieku/danser-go"
pkgver=0.6.8
pkgrel=1
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go."
arch=('any')
license=('MIT')
conflicts=('danser-git')
source=(
    "https://github.com/Wieku/danser-go/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('d043386c9ac612b2602aed8963aa1193e093604601c43b33b68081ebabe15f79')
depends=(
    'libyuv'
    'ffmpeg'
)
makedepends=(
    'xorg-server-devel'
    'go>=1.17'
    'gcc'
)

build() {
    cd "${srcdir}/danser-go-${pkgver}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${srcdir}/danser-go-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/danser" "${pkgdir}/usr/bin"

    install -Dm755 libbass.so libbass_fx.so libbassmix.so "${pkgdir}/usr/lib/danser"
    cp -r "assets" "${pkgdir}/usr/lib/danser/assets"
    chmod 755 "${pkgdir}/usr/lib/danser/assets"

    install -Dm755 danser-go "${pkgdir}/usr/lib/danser/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/lib/danser/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
