# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Maintainer: GalaxyLJGD <pentestian [AT] airmail [DOT] cc>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=5.3.5
pkgrel=3
pkgdesc="Real-time strategy game based on history, mythology and fiction"
arch=('i686' 'x86_64')
url="https://andrettin.github.io/"
license=('GPL2' 'CCPL:by-sa' 'custom:CC0')
depends=('hicolor-icon-theme'
         'qt5-graphicaleffects'
         'qt5-location'
         'qt5-multimedia'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'sdl2_mixer'
         'tolua++')
makedepends=('boost' 'cmake' 'glu')
source=("wyrmsun-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmsun/archive/v${pkgver}.tar.gz"
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz"
        'werror_format_security.patch')
md5sums=('f519b26169499e52517196b24813d2ac'
         '73b2e1bf4e29c0663af23d025c104f7c'
         '426efa2e8ee8b3ab46736d634599963c')

prepare() {
  cd "${srcdir}/Wyrmgus-${pkgver}"
  # This patch fixes the compilation error with the -Werror=format_security flag
  # until a new version is released.
  patch src/player/player.cpp "${srcdir}/werror_format_security.patch"
}

build() {
  cd "${srcdir}/Wyrmgus-${pkgver}"
  cmake . \
    -DCMAKE_BUILD_TYPE=None \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DWITH_GEOJSON=OFF \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -Wno-dev
  cmake --build . --target wyrmgus_main

  cd "${srcdir}/Wyrmsun-${pkgver}"
  cmake . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBIN_DIR='bin/' \
    -Wno-dev
  cmake --build .
}

check() {
  cd "${srcdir}/Wyrmgus-${pkgver}"
  cmake --build . --target wyrmgus_test
  ./wyrmgus_test
}

package() {
  cd "${srcdir}/Wyrmgus-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp wyrmgus "${pkgdir}/usr/bin/"

  cd "${srcdir}/Wyrmsun-${pkgver}"
  cmake --install . --prefix "${pkgdir}/usr/"
  install -Dm644 cc0.txt "${pkgdir}/usr/share/licenses/${pkgname}/cc0.txt"
}
