# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='geant4-full'
pkgver=11.1.0
pkgrel=2
pkgdesc="A simulation toolkit for particle physics interactions - includes all the optional libraries"
depends=(
  'cmake>=3.16'
  'xerces-c>=3'
  'qt6-base'
  'glu'
  'openmotif'
  'soqt'
  'zlib'
  'python>=3'
  'boost'
)
conflicts=('geant4_devel' 'geant4' 'geant4-debug')
optdepends=(
  'java-environment'
  'tcsh'
  'geant4-lend'
)
url="http://geant4.cern.ch/"
arch=('x86_64')
license=('custom: http://geant4.cern.ch/license/')
options=('!emptydirs')
source=(
  "http://geant4-data.web.cern.ch/releases/geant4-v${pkgver}.tar.gz"
  "geant4-full.install"
)
sha256sums=(
  "051e43066152c373f74746bdffe6f0c9e4175ad9cf1eb7b67da0dc1a05d0b985"
  "640ebc759befc85b3d486d83b706c229877130b392c1bfee0e78cd1c9b347c11"
)
install=geant4-full.install

build() {

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  env -i \
    QT_SELECT=6 \
    PATH=/usr/bin \
    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DGEANT4_BUILD_MULTITHREADED=ON \
      -DGEANT4_INSTALL_DATA=ON \
      -DGEANT4_USE_G3TOG4=ON \
      -DGEANT4_USE_GDML=ON \
      -DGEANT4_USE_INVENTOR_QT=ON \
      -DGEANT4_USE_OPENGL_X11=ON \
      -DGEANT4_USE_QT=ON \
      -DGEANT4_USE_RAYTRACER_X11=ON \
      -DGEANT4_USE_SYSTEM_ZLIB=ON \
      -DGEANT4_USE_XM=ON \
      -DGEANT4_INSTALL_PACKAGE_CACHE=OFF \
      -DGEANT4_USE_PYTHON=ON \
      -DGEANT4_USE_TOOLSSG=QT \
      -DGEANT4_BUILD_TLS_MODEL=global-dynamic \
      ../geant4-v${pkgver}

  make VERBOSE=1
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
