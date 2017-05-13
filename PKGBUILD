# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: egore911
# Contributor: Falcata
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=caelum-ogre1.8
pkgver=0.6.1
pkgrel=5
pkgdesc="Library for OGRE targeted to help create nice-looking atmospheric effects. Built against OGRE 1.8."
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre-1.8' 'cegui' 'doxygen' 'boost')
makedepends=('cmake')
provides=('caelum')
license=('LGPL')

source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/caelum/caelum-${pkgver}.zip caelumplugin.patch libname.patch) 
sha512sums=('d1c6135f88491c3d45211de1652c0b11d8de30dbba8edeb440f52e35964be48b3cf45cfc4cfa926642b4d6e43751e4e449524046af21a2c3d1b20ae3576585f1'
         'c3b8f6ad9f2e14fe08f09409dd1f97c5cd1165127f443cde7b8e4dc89032c91d4f0087d4348f1fc8103aa5b123316ffe10cc06ab3ef49d2603d1b2fd201ed5b2'
         'fd37cb47704c01a0b9d1637102ff5229a7c3828b24dd0648e7a951539d00d6ffb078e1c956809a2c4d43ed90f8599074d2a18e5d0d449d13aa70b838663793c6')

build() {
  export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"
  export LD_LIBRARY_PATH="/opt/OGRE-1.8/lib:$LD_LIBRARY_PATH"
  cd ${srcdir}/caelum-${pkgver}
  patch -p0 < ${srcdir}/caelumplugin.patch main/src/CaelumPlugin.cpp
  patch -p0 < ${srcdir}/libname.patch

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  CXXFLAGS+=' -std=gnu++98'
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/opt/Caelum-OGRE1.8 
  make
}

package() {
  cd ${srcdir}/caelum-${pkgver}/build
  make DESTDIR=${pkgdir} install
  rm -r ${pkgdir}/opt/Caelum-OGRE1.8/doc
}
