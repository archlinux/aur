# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=danser
url="https://github.com/Wieku/danser-go"
pkgver=0.6.8
pkgrel=2
pkgdesc="Dancing visualizer of osu! maps and custom osu! client written in Go."
arch=('any')
license=('MIT')
conflicts=('danser-git')
source=(
    "https://github.com/Wieku/danser-go/archive/refs/tags/${pkgver}.tar.gz"
    "danser"
)
sha256sums=('d043386c9ac612b2602aed8963aa1193e093604601c43b33b68081ebabe15f79'
            'ae1b9fddfa393c1e0f3e58581d8587973d4551e98a34058db8e23e6beee844e3')
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

    # until 0.6.9 we will not symlink, instead we'll use a bash script
    # ln -s "/usr/lib/danser/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/danser" "${pkgdir}/usr/bin/${pkgname}"
}
