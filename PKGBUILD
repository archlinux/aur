# Maintainer: Stella <jens300304@gmail.com>
pkgname=danser
url="https://github.com/Wieku/danser-go"
pkgver=0.6.9
pkgrel=1
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go."
arch=('any')
license=('MIT')
conflicts=('danser-git')
source=(
    "https://github.com/Wieku/danser-go/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('8a4c7c61b8b91d3d50a22a1d14280af9fd792622ad957210f66c512e6d72451f')
depends=(
    'libyuv'
    'ffmpeg'
)
makedepends=(
    'gcc'
    'go>=1.17'
    'libxi'
    'libxinerama'
    'libxrandr'
    'xorg-server-devel'
)

build() {
    cd "${srcdir}/danser-go-${pkgver}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external 
            -extldflags \"${LDFLAGS}\" 
            -s -w -X 'github.com/wieku/danser-go/build.VERSION=$pkgver' 
            -X 'github.com/wieku/danser-go/build.Stream=Release'" \
        .

    go run tools/assets/assets.go ./

}

package() {
    cd "${srcdir}/danser-go-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/danser" "${pkgdir}/usr/bin"

    install -Dm755 libbass.so libbass_fx.so libbassmix.so assets.dpak "${pkgdir}/usr/lib/danser"
    install -Dm755 danser-go "${pkgdir}/usr/lib/danser/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/lib/danser/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
