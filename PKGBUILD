# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Ingo Bürk <admin (at) airblader (dot) de>

pkgname=huestacean
pkgver=2.6
pkgrel=4
pkgdesc="Philips Hue control app for desktop with screen syncing"
arch=('any')
url="https://github.com/BradyBrenot/huestacean"
license=('Apache')
depends=(
    'libxinerama'
    'libxtst'
    'python'
    'qt5-base'
    'qt5-quickcontrols2'
    'qt5-remoteobjects'
)
makedepends=('git' 'cmake')
provides=("${pkgname}")
source=(
    "${pkgname}::git+https://github.com/BradyBrenot/huestacean#tag=v${pkgver}"
    "${pkgname}.desktop"
    "${pkgname}.png"
)
b2sums=(
    'SKIP'
    'e720c8ff138344a8ca04b5325f70055a19d0b4a88b5210bfb874e5a4e8c0f3bf4fa19f8cf644c0a786d489917c22f2b766d61ee47152654a1ad9d1b80a758b35'
    'dbc9dec9ef3c48b39677da765d7266da4affba17dce25991dbd1f37fcc53146d56a43d5cce8c0f2484073e3fac0159959e9f3d8e129d9d39ff46fe7f2f564d76'
)

prepare() {
    cd "${pkgname}"
    git submodule sync
    git submodule update --init --recursive
}

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}"

    sed -i "s/REPL_NAME/${pkgname}/g"               "${pkgname}.desktop"
    sed -i "s/REPL_COMMENT/${pkgdesc}/g"            "${pkgname}.desktop"

    install -Dm 755 "build/${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "${pkgname}.desktop"            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 "${pkgname}.png"                "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
