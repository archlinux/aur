# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=elmerfem
pkgname=elmerfem-gui
pkgver=26.1
pkgrel=2
pkgdesc="Graphical user interface for the Elmer software suit"
arch=('x86_64')
url="https://www.elmerfem.org"
license=('GPL-2.0-only AND LicenseRef-ElmerGUI-exception')
conflicts=('elmerfem-git' 'elemerfem')
options=(!debug)

makedepends=(
    'cli11'
    'cmake'
    'eigen3'
    'fast_float'
    'utf8cpp'
)
depends=(
    'alembic'
    'anari-sdk'
    'boost'
    'elmerfem-base'
    'freetype2'
    'libharu'
    'mariadb-libs'
    'nlohmann-json'
    'opencascade'
    'openvr'
    'openxr'
    'paraview'
    'postgresql-libs'
    'qt6-base'
    'qt6-declarative'
    'qwt'
    'vtk'
)

source=(
    "${_name}-${pkgver}.tar.gz::https://github.com/ElmerCSC/elmerfem/archive/release-${pkgver}.tar.gz"
    'ElmerGUI.desktop'
)
b2sums=(
    'ec65eb06153dfaeda5b76f746a37e1cfa7ad9d3d2bf8d7baeb7b2d50d183ed4a160c545a657d614051b20f053e4e94a08305adad504242fa38f82d86deeb9956'
    'd1855a061a041f65e035956d4f05e235a381f65b10468294e674f70565b2836c8258b6d7d9d14f3d42bd8155170511aad20042e84ff21d99d4b88fa36f5467fd'
)

build() {
    local cmake_opts=(
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D BUILD_SHARED_LIBS=ON
        -S "${_name}-release-${pkgver}"/ElmerGUI
        -B "${_name}-release-${pkgver}"/ElmerGUI/build
        -D CMAKE_INSTALL_PREFIX=/usr

        # ElmerGUI
        -D WITH_OCC=ON
        -D WITH_PARAVIEW=ON
        -D WITH_QT6=ON
        -D WITH_QWT=ON
        -D WITH_VTK=ON
    )

    cmake "${cmake_opts[@]}"
    cmake --build "${_name}-release-${pkgver}"/ElmerGUI/build
}

package() {
    DESTDIR="$pkgdir" cmake --install "${_name}-release-${pkgver}"/ElmerGUI/build

    mv "${pkgdir}/usr/lib/ElmerGUI/ngcore/libng.so" "${pkgdir}/usr/lib/"
    rm -rf "${pkgdir}/usr/lib/ElmerGUI"

    # Licenses
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/ElmerGUI/license_texts"/* "${pkgdir}/usr/share/licenses/${pkgname}"/
    rm -rf "${pkgdir}/usr/share/licenses/${pkgname}"/GPL-2 "${pkgdir}/usr/share/ElmerGUI/license_texts"

    # Desktop
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps" "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${pkgdir}/usr/share/applications"
    mv "${srcdir}/${_name}-release-${pkgver}/pics/ElmerLogoPlain64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ElmerFEM.png"
    mv "${srcdir}/${_name}-release-${pkgver}/pics/ElmerLogoPlain128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ElmerFEM.png"
    cp "${srcdir}/ElmerGUI.desktop" "${pkgdir}/usr/share/applications/ElmerGUI.desktop"
}
