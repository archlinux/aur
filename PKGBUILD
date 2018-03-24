# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=magics++
Pkgname=Magics
pkgver=3.0.2
_attnum=3473464
pkgrel=1
pkgdesc="Magics is the latest generation of the ECMWF's Meteorological plotting software MAGICS."
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/MAGP"
license=('Apache')
depends=('qt5-base' 'proj' 'fftw' 'pango' 'netcdf-cxx-legacy' 'eccodes' 'python')
optdepends=('libaec' 'odb_api')
makedepends=('perl-xml-parser' 'gcc-fortran' 'swig' 'python2-numpy' 'cmake' 'boost' 'emos')
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${Pkgname}-${pkgver}-Source.tar.gz patch g++7.patch)
md5sums=('cbe036ecc0dbcc6ed03934605a3a797b'
         '73b04ae78df8c2f6e88b2a36dcd2dd96'
         '79ff00492ab8bbfce1a1c7b2e82c5e48')

build() {
  cd "$srcdir/${Pkgname}-${pkgver}-Source"
  patch -p0 -i ../patch
  patch -p2 -i ../g++7.patch
  rm -fr src/boost/range && ln -sf /usr/include/boost/range src/boost
  mkdir -p build
  cd build
  CC=gcc CXX='g++' \
  cmake -DCMAKE_LINKER_FLAGS="-pthread" \
    -DCMAKE_SHARED_LINKER_FLAGS="-pthread" \
    -DCMAKE_EXE_LINKER_FLAGS="-pthread" \
    -Dodb_api_DIR=/usr/share/odb_api/cmake \
    -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CC_COMPILER=gcc \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DENABLE_METVIEW=1 -DENABLE_QT5=1 -DPYTHON_EXECUTABLE=/usr/bin/python2 ..
  make || return 1
}

package() {
  cd "$srcdir/${Pkgname}-${pkgver}-Source/build"
  make DESTDIR="$pkgdir" install || return 1
}
