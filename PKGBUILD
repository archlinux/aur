# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=4.1.4
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
md5sums=('2242badbed6e96c1fdf32a040abe730a'
         'd450f68291155bbe39a697e6df2a8f9c')

build() {
  cd ${srcdir}/Wyrmgus-${pkgver}
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DWITH_GEOJSON=OFF \
  ;
  cmake --build . --target stratagus_main

  cd "${srcdir}/Wyrmsun-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr/' .
  cmake --build .
}

check() {
  cd ${srcdir}/Wyrmgus-${pkgver}
  cmake --build . --target stratagus_test
  ./stratagus_test
}

package() {
  cd ${srcdir}/Wyrmgus-${pkgver}
  mkdir -p "${pkgdir}/usr/bin/"
  cp wyrmgus "${pkgdir}/usr/bin/"

  cd ${srcdir}/Wyrmsun-${pkgver}
  cmake --install . --prefix "${pkgdir}/usr/"
}
