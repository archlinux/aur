# Maintainer: Riderius <riderius.help@gmail.com>

_pkgname=mcmap
pkgname="${_pkgname}-git"
pkgver=3.0.3.r1.g9e626f1
pkgrel=1
pkgdesc="Pixel-art map visualizer for Minecraft. Maps are drawn from an isometric perspective. "
arch=('x86_64')
url="https://github.com/spoutn1k/${_pkgname}"
license=('GPL3')
depends=('zlib' 'libpng' 'spdlog' 'fmt' 'qt6-tools')
makedepends=('git' 'gcc' 'make' 'cmake')
checkdepends=('gtest')
conflicts=('mcmap')
provides=('mcmap'
          'mcmap-gui')
CFLAGS=('${CFLAGS} -U_GLIBCXX_ASSERTIONS')
CXXFLAGS=('${CXXFLAGS} -U_GLIBCXX_ASSERTIONS')
source=("${pkgname}::git+https://github.com/spoutn1k/${_pkgname}.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '67dff6174f3ef3c072560b6b2c161470d5f76a6282bf9bf6afa9d14750459714')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

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
    install -Dm755 "${srcdir}/${pkgname}/build/bin/mcmap" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${pkgname}/build/bin/mcmap-gui" "${pkgdir}/usr/bin/${_pkgname}-gui"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/src/graphical/icons/grass_block.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
