# Maintainer:  Nicholas Wang <me#nicho1as.wang>

pkgname=maplibre-native-qt-git
pkgver=v3.0.0.r38.g181f28b
pkgrel=1
pkgdesc="MapLibre Native Qt Bindings and Qt Location Plugin"
arch=('x86_64')
depends=('ccache' 'cmake' 'gcc' 'icu' 'ninja' 'qt6-base' 'qt6-location')
source=("${pkgname}::git+https://github.com/maplibre/maplibre-native-qt.git")
license=('BSD-2-Clause')
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive

}

build() {
  mkdir -p "${srcdir}/install"
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake "${srcdir}/${pkgname}" -G Ninja \
    -DCMAKE_BUILD_TYPE="Release" \
    -DQT_NO_PRIVATE_MODULE_WARNING=ON \
    -DCMAKE_C_COMPILER_LAUNCHER="ccache" \
    -DCMAKE_CXX_COMPILER_LAUNCHER="ccache" \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/install" \
    -DMLN_WITH_VULKAN=ON
#    -DMLN_WITH_OPENGL=ON

    ninja
    ninja install
}

package() {
  mkdir -p ${pkgdir}/usr
  cp -rpf ${srcdir}/install/include ${pkgdir}/usr/include
  cp -rpf ${srcdir}/install/lib ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/lib/qt6/
  cp -rpf ${srcdir}/install/qml ${pkgdir}/usr/lib/qt6/qml
  cp -rpf ${srcdir}/install/plugins ${pkgdir}/usr/lib/qt6/plugins
}
