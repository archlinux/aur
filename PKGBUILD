# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

pkgname=osgearth-qt4
_pkgname=osgearth
pkgver=2.7
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph. Dependency for QGIS Globe Plugin"
arch=('i686' 'x86_64')
url='http://www.osgearth.org'
license=('LGPL')
depends=('openscenegraph-qt4' 'gdal' 'minizip' 'qt4')
makedepends=('cmake')
provides=('osgearth')
conflicts=('osgearth')
source=("https://github.com/gwaldron/osgearth/archive/${_pkgname}-${pkgver}.tar.gz" "qt4.patch")
md5sums=('aad15a3ee27a34dcabc9b8f4922a1e96'
         'ea9fc5a769b428767b5b79e325641f50')

prepare() {
  cd ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}
  # Fix build with QT4 (Debian)
  patch -p0  -i ${srcdir}/qt4.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}

  #Build
  if [[ -d "build" ]]; then
    (rm -rf build)
  fi

  mkdir build
  cd build

  cmake \
  -DLIB_POSTFIX= \
  -DCMAKE_INSTALL_PREFIX=/usr \
  ..

  make -j4
}

package() {
  cd ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir install
  
  install -d ${pkgdir}/usr/share/osgearth
  install -d ${pkgdir}/usr/share/osgearth/test
  install -d ${pkgdir}/usr/share/osgearth/data
  install -Dm644 ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/tests/* ${pkgdir}/usr/share/osgearth/test
  cp -rfv ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/data/* ${pkgdir}/usr/share/osgearth/data
}
