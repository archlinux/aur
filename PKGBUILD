# Maintainer: Jonas Pucher <jonaas.pucher000000@gmail.com>

pkgname=samurai-render
pkgver=24.03.0
pkgrel=1
pkgdesc="Easy to use library to render into the Layer Shell of wlroots based wayland compositors"
arch=("x86_64" "aarch64")
url="https://github.com/Samudevv/${pkgname}"
license=("ZLIB")
depends=("wayland" "cairo" "libglvnd")
makedepends=("xmake" "gcc" "wayland-protocols")
source=(
    "${pkgname}-${pkgver}::https://github.com/Samudevv/samurai-render/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
    "d3c25eb3cfe002f8092071a7a420b8174dd0be79b6e3e4f6269252099dbc75ec"
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    xmake config \
        -p linux \
        -k shared \
        -m release \
        --build_examples=n \
        --backend_cairo=y \
        --backend_opengl=y
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    xmake -vw
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    XMAKE_ROOT=y xmake install -o "${pkgdir}/usr/"
    mkdir -p \
        "${pkgdir}/usr/include/samure/" \
        "${pkgdir}/usr/include/samure/wayland" \
        "${pkgdir}/usr/include/samure/backends"
    cp samure/*.h "${pkgdir}/usr/include/samure/"
    cp samure/wayland/*.h "${pkgdir}/usr/include/samure/wayland"
    cp samure/backends/*.h "${pkgdir}/usr/include/samure/backends"
    rm ${pkgdir}/usr/include/*.h
}
