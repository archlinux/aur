# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

pkgname=osgearth
pkgver=2.10.2
pkgrel=2
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url='http://www.osgearth.org'
license=('LGPL')
depends=('openscenegraph' 'gdal' 'minizip' 'qt5-base' 'rocksdb' 'duktape')
makedepends=('cmake')
provides=('osgearth')
source=("https://github.com/gwaldron/osgearth/archive/${pkgname}-${pkgver}.tar.gz"
        "geos-3_8-support.patch")
md5sums=('24f01afedb2eeac8154bf64772b7cbc7'
         '590959bbe04444efc63f96f4b48db6ac')


prepare(){ 
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  patch -p1 < ../geos-3_8-support.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

  #Build
  if [[ -d "build" ]]; then
    (rm -rf build)
  fi

  mkdir build
  cd build

  cmake \
  -DLIB_POSTFIX= \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DWITH_STATIC_ROCKSDB=ON \
  -DWITH_EXTERNAL_DUKTAPE=ON \
  ..

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir install
  
  install -d ${pkgdir}/usr/share/osgearth
  install -d ${pkgdir}/usr/share/osgearth/test
  install -d ${pkgdir}/usr/share/osgearth/data
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/tests/* ${pkgdir}/usr/share/osgearth/test
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/data/* ${pkgdir}/usr/share/osgearth/data
}
