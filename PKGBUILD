# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=magics++
Pkgname=Magics
pkgver=3.3.1
_attnum=3473464
pkgrel=2
pkgdesc="Magics is the latest generation of the ECMWF's Meteorological plotting software MAGICS."
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/MAGP"
license=('Apache')
depends=('qt5-base' 'proj' 'fftw' 'pango' 'netcdf-cxx-legacy' 'eccodes' 'python')
optdepends=('libaec' 'odb_api')
makedepends=('perl-xml-parser' 'gcc-fortran' 'swig' 'python2-numpy' 'cmake' 'boost' 'emos')
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${Pkgname}-${pkgver}-Source.tar.gz patch)
md5sums=('b5b2bee64fce1298752f6d4535d795a3'
         '73b04ae78df8c2f6e88b2a36dcd2dd96')

build() {
  cd "$srcdir/${Pkgname}-${pkgver}-Source"
  patch -p0 -i ../patch
 # patch -p2 -i ../g++7.patch
  rm -fr src/boost && ln -sf /usr/include/boost src
  [ -x /usr/bin/odb ] && has_odb=ON || has_odb=OFF
  mkdir -p build
  cd build
  CC=gcc CXX='g++' \
  cmake -DCMAKE_LINKER_FLAGS="-pthread" \
    -DCMAKE_SHARED_LINKER_FLAGS="-pthread" \
    -DCMAKE_EXE_LINKER_FLAGS="-pthread" -DENABLE_ODB=${has_odb} \
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
