# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_name=elmerfem
pkgname=elmerfem-gui
pkgver=26.2.1
pkgrel=1
pkgdesc="Graphical user interface for the Elmer software suit"
arch=('x86_64')
url="https://www.elmerfem.org"
license=('GPL-2.0-only AND LicenseRef-ElmerGUI-exception')
conflicts=('elmerfem-git' 'elemerfem')
options=(!debug)

makedepends=(
    # Build tools
    'cli11'
    'cmake'
    'git'

    # Libs
    'boost'
    'eigen'
    'fast_float'
    'nlohmann-json'
    'utf8cpp'
)
depends=(
    'boost-libs'
    'freetype2'
    'glu'
    'opencascade'
    'paraview'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qwt'
    'vtk'
)
optdepends=('elmerfem-base: FEM solver')

source=(
    "${_name}::git+https://github.com/ElmerCSC/elmerfem#tag=release-${pkgver}"
    'ElmerGUI.desktop'
    'dep_clean.patch'
)
b2sums=(
    '1f704736b11a652166e212ae09de1bbd7a604da4c726c7d46e1dd2b838461c2a834a046e36b4ec5ce7fbb0aef8c17e70b16978f0a785fd16a322c2e5236a59f5'
    'd1855a061a041f65e035956d4f05e235a381f65b10468294e674f70565b2836c8258b6d7d9d14f3d42bd8155170511aad20042e84ff21d99d4b88fa36f5467fd'
    'c740c0855379e27e5a8e9f7dc9a3c5a62f7cd002fefcc5e33ee4f7a4aaff9b19e9c4721d368652c81f50e5498e25f77bf0a87b6866de36af2195602fc430915b'
)
_patches=()

prepare() {
    cd $_name
    # git cherry-pick -n "${_patches[@]}"
    patch -p1 -i ../dep_clean.patch
}

build() {
    local cmake_opts=(
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D BUILD_SHARED_LIBS=ON
        -S "${_name}"/ElmerGUI
        -B "${_name}"/ElmerGUI/build
        -D CMAKE_INSTALL_PREFIX=/usr

        # ElmerGUI
        -D WITH_OCC=ON
        -D WITH_PARAVIEW=ON
        -D WITH_QT6=ON
        -D WITH_QWT=ON
        -D WITH_VTK=ON
        -D VTK_INCLUDE_DIRS=/usr/include/vtk
    )

    cmake "${cmake_opts[@]}"
    cmake --build "${_name}"/ElmerGUI/build
}

package() {
    DESTDIR="$pkgdir" cmake --install "${_name}"/ElmerGUI/build

    mv "${pkgdir}/usr/lib/ElmerGUI/ngcore/libng.so" "${pkgdir}/usr/lib/"
    rm -rf "${pkgdir}/usr/lib/ElmerGUI"

    # Licenses
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/ElmerGUI/license_texts"/* "${pkgdir}/usr/share/licenses/${pkgname}"/
    rm -rf "${pkgdir}/usr/share/licenses/${pkgname}"/GPL-2 "${pkgdir}/usr/share/ElmerGUI/license_texts"

    # Desktop
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps" "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${pkgdir}/usr/share/applications"
    mv "${srcdir}/${_name}/pics/ElmerLogoPlain64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ElmerFEM.png"
    mv "${srcdir}/${_name}/pics/ElmerLogoPlain128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ElmerFEM.png"
    cp "${srcdir}/ElmerGUI.desktop" "${pkgdir}/usr/share/applications/ElmerGUI.desktop"
}
