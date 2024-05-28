# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=mcmap
pkgver=3.0.3
pkgrel=2
pkgdesc="Pixel-art map visualizer for Minecraft. Maps are drawn from an isometric perspective. "
arch=('x86_64')
url="https://github.com/spoutn1k/${pkgname}"
license=('GPL3')
depends=('zlib' 'libpng' 'spdlog' 'fmt' 'qt6-tools')
makedepends=('git' 'gcc' 'make' 'cmake')
checkdepends=('gtest')
provides=('mcmap'
          'mcmap-gui')
CFLAGS=('${CFLAGS} -U_GLIBCXX_ASSERTIONS')
CXXFLAGS=('${CXXFLAGS} -U_GLIBCXX_ASSERTIONS')
source=("${pkgname}::git+https://github.com/spoutn1k/${pkgname}.git#tag=v${pkgver}"
        "${pkgname}.desktop")
sha256sums=('510bf2218bebce145eca02289c7a740a2ef70783601596a61689f9f99a38b804'
            '67dff6174f3ef3c072560b6b2c161470d5f76a6282bf9bf6afa9d14750459714')

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${srcdir}/${pkgname}/build"
    cd "${srcdir}/${pkgname}/build"
    cmake ..
    make mcmap mcmap-gui
}

check() {
    cd "${srcdir}/${pkgname}/build"
    make run_tests
    cd "${srcdir}/${pkgname}/build/bin" && ./run_tests
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/build/bin/mcmap" "${pkgdir}/usr/bin/mcmap"
    install -Dm755 "${srcdir}/${pkgname}/build/bin/mcmap-gui" "${pkgdir}/usr/bin/mcmap-gui"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/src/graphical/icons/grass_block.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
