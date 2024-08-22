# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: libele <libele@disroot.org>
pkgname=dust3d-git
_pkgname=Dust3D
pkgver=1.0.0.rc.9.r23.g6195093
pkgrel=1
pkgdesc="3D watertight modeling software (git version)"
arch=('any')
url="https://dust3d.org/"
_ghurl="https://github.com/huxingyi/dust3d"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'qt5-base'
    'qt5-svg'
)
makedepends=(
    'git'
    'gendesk'
    'gcc'
    'cmake'
    'libicns'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
build() {
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Graphics" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    sed "28i\#include <cstdint>;s|const std::uint8_t|const uint8_t|g" -i "${pkgname%-git}"/base/ds3_file.h
    sed "30i\#include <stdint.h>" -i "${pkgname%-git}"/mesh/solid_mesh_boolean_operation.h
    sed "4i\#include <cstdint>;s|std::uint32_t|uint32_t|g" -i application/third_party/fbx/src/fbxnode.h
    cd "${srcdir}/${pkgname//-/.}/application"
    icns2png -x "${pkgname%-git}.icns"
    mv "${pkgname%-git}_512x512x32.png" "${pkgname%-git}.png"
    sed "s|${pkgname%-git}.icns|${pkgname%-git}.png|g" -i application.pro
    qmake
    make
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/application/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/application/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}