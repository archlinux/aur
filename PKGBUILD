# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: libele <libele@disroot.org>
pkgname=dust3d-git
_pkgname=Dust3D
pkgver=1.0.0.r1.gca367c2
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
    'qt5-multimedia'
)
makedepends=(
    'git'
    'gendesk'
    'libicns'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    sed -i "1i #include <cstdint>" dust3d/base/ds3_file.h
    sed -i "1i #include <cstdint>" application/third_party/fbx/src/fbxnode.h
    sed -i "1i #include <cstdint>" application/third_party/fbx/src/fbxdocument.h
    sed -i "1i #include <cstdint>" application/third_party/fbx/src/fbxproperty.h
    sed -i "1i #include <cstdint>" application/third_party/fbx/src/fbxutil.h
    sed -i "1i #include <cstdint>" third_party/earcut.hpp/include/mapbox/earcut.hpp
    sed -i "1i #include <cstdint>" dust3d/mesh/solid_mesh_boolean_operation.h
    cd "${srcdir}/${pkgname//-/.}/application"
    icns2png -x "${pkgname%-git}.icns"
    mv "${pkgname%-git}_512x512x32.png" "${pkgname%-git}.png"
    sed -i "s/${pkgname%-git}.icns/${pkgname%-git}.png/g" application.pro
    qmake
    make -j`nproc`
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/application/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/application/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
