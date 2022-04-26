# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=5.3.5
pkgrel=1
pkgdesc="Real-time strategy game based on history, mythology and fiction"
arch=('i686' 'x86_64')
url="http://andrettin.github.io/"
license=('GPL2')
depends=(
    'hicolor-icon-theme'
    'qt5-location'
    'qt5-multimedia'
    'sdl_mixer'
    'tolua++'
)
makedepends=('boost' 'cmake' 'glu')
source=("wyrmsun-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmsun/archive/v${pkgver}.tar.gz"
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz")
md5sums=('f519b26169499e52517196b24813d2ac'
         '73b2e1bf4e29c0663af23d025c104f7c')

build() {
  cd "${srcdir}/Wyrmgus-${pkgver}"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DWITH_GEOJSON=OFF \
  ;
  cmake --build . --target wyrmgus_main

  cd "${srcdir}/Wyrmsun-${pkgver}"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr/' \
    -DBIN_DIR='bin/' \
  ;
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
}
