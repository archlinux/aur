# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Maintainer: GalaxyLJGD <pentestian [AT] airmail [DOT] cc>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=5.3.6
pkgrel=1
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
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz")
md5sums=('fd77be9c4e3c425b0cab35c3545ddbba'
         '3210ec84d8ef96d6c352ecc149d4c82c')

build() {
  cd "${srcdir}/Wyrmgus-${pkgver}"
  cmake . \
    -DCMAKE_BUILD_TYPE=None \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DWITH_GEOJSON=OFF \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -DENABLE_USEGAMEDIR=OFF \
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
