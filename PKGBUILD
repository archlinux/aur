# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=5.3.4
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
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz"
        '5_3_4_source_location.patch')
md5sums=('ce43520e9b2020fa1c341df4a8d4272d'
         '7b578710922a10b807b3b56d144a76d6'
         '530da5bea60ef115e66a7c491d99f9ce')

prepare() {
  cd "${srcdir}/Wyrmgus-${pkgver}"

  # https://github.com/Andrettin/Wyrmgus/issues/179
  patch --forward --strip=1 --input="${srcdir}/5_3_4_source_location.patch"
}

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
