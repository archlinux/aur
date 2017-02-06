# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=magics++
Pkgname=Magics
pkgver=2.31.0
_attnum=3473464
pkgrel=1
pkgdesc="Magics is the latest generation of the ECMWF's Meteorological plotting software MAGICS."
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/MAGP"
license=('Apache')
depends=('qt5-base' 'proj' 'fftw' 'pango' 'netcdf-cxx-legacy' 'eccodes' 'python')
optdepends=('libaec')
makedepends=('perl-xml-parser' 'gcc-fortran' 'swig' 'python2-numpy' 'cmake' 'boost' 'emos')
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${Pkgname}-${pkgver}-Source.tar.gz patch)
md5sums=('3564dca9e1b4af096fd631906f5e6c89'
         'da04828807d7fda1d767197c6d69ec0b')

build() {
  cd "$srcdir/${Pkgname}-${pkgver}-Source"
  patch -p0 -i ../patch
  mkdir -p build
  cd build
  CC=gcc CXX=g++ \
  cmake -DCMAKE_LINKER_FLAGS="-pthread" \
    -DCMAKE_SHARED_LINKER_FLAGS="-pthread" \
    -DCMAKE_EXE_LINKER_FLAGS="-pthread" \
    -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CC_COMPILER=gcc \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share -DENABLE_ODB=0 \
    -DENABLE_METVIEW=1 -DENABLE_QT5=1 -DPYTHON_EXECUTABLE=/usr/bin/python2 ..
  make || return 1
}

package() {
  cd "$srcdir/${Pkgname}-${pkgver}-Source/build"
  make DESTDIR="$pkgdir" install || return 1
}
