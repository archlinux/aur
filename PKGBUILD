# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=danser
url="https://github.com/Wieku/danser-go"
pkgver=0.6.6
pkgrel=1
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go."
arch=('any')
license=('MIT')
source=(
    "https://github.com/Wieku/danser-go/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
    'b1c0e82df3c26683b98ba4f3f60db9ad52a619b9ed6d78b1ce00f30904f8512e'
)
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
    mkdir -p "${pkgdir}/opt/danser" "${pkgdir}/usr/bin"
    chmod 777 "${pkgdir}/opt/danser"
    install -Dm755 libbass.so libbass_fx.so libbassmix.so "${pkgdir}/opt/danser"
    # i hate install i hate install i hate in-
    cp -r "assets" "${pkgdir}/opt/danser/assets"
    chmod 755 "${pkgdir}/opt/danser/assets"

    install -Dm755 danser-go "${pkgdir}/opt/danser/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/danser/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
