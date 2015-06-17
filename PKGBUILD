# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname='libgrid-svn'
_pkgname=libgrid
pkgver=0
pkgrel=1
pkgdesc="3D Resampling Core. The Grid Library (libGrid) is the resampling backend for the libMini terrain rendering engine."
arch=('i686' 'x86_64')
url='https://code.google.com/p/libgrid/'
license=('GPL')
provides=("$pkgname")

depends=('libmini-svn' 'libiconv')
makedepends=('cmake' 'subversion')
optdepends=()
options=('staticlibs')
source=("${pkgname}::svn+http://libgrid.googlecode.com/svn/libgrid/grid")
md5sums=('SKIP')

pkgver() {
  svnversion "${SRCDEST}/${pkgname}" | tr -d [A-z]
}

prepare () {
  cd "${pkgname}"

  mkdir ./grid
  cp -rfv *.h ./grid
}

build() {
  cd "${pkgname}"  

  if [ -d build ]; then
    rm -rf build
  fi

  mkdir build
  cd build

  cmake ../ \
  -DBUILD_SQUISH_WITH_SSE2=OFF \
  -DGRID_INCLUDE_DIR=${srcdir}/${pkgname}

  make
}

package() {
  cd "${pkgname}"
  cd build

  make DESTDIR="$pkgdir/" install

  rm -rfv "${pkgdir}/usr/local/include/mini/"  
  rm -rfv "${pkgdir}/usr/local/include/squish.h"  
  rm -rfv "${pkgdir}/usr/local/lib/libsquish.a"  
}