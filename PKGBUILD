# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Anatol Pomozov <anatol.pomozov gmail>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgname=gflags
pkgname=mingw-w64-$_pkgname
pkgver=2.2.1
pkgrel=1
pkgdesc='C++ Library for commandline flag processing (mingw-w64)'
arch=(any)
url='https://github.com/schuhschuh/gflags'
license=('BSD')
makedepends=('mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
_sourcename=${_pkgname}-${pkgver}
source=(${_sourcename}.tar.gz::https://github.com/schuhschuh/gflags/archive/v$pkgver.tar.gz)
sha512sums=('e919cbdcff1f993ddbfa9c06d8e595566a4717c27ff62f388a64c0e6b4683a93211c24ce78485eae84c2c76053341574064e6c56af185fc2782e2816b26e1fc9')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${_sourcename}
  #sed -i "s/\bBin\b/bin/" CMakeLists.txt
  sed -i "s/\bLib\b/lib/" CMakeLists.txt
  sed -i "s/\bInclude\b/include/" CMakeLists.txt
  sed -i "s/\bCMake\b/cmake/" CMakeLists.txt

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    pushd build-${_arch}
    ${_arch}-cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DREGISTER_INSTALL_PREFIX=OFF \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_STATIC_LIBS=ON \
      -DBUILD_TESTING=ON
    make
    popd
  done
}

package() {
  cd ${_sourcename}
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR=${pkgdir} install
    popd
    install -D -m644 COPYING.txt ${pkgdir}/usr/${_arch}/share/licenses/${_pkgname}/COPYING.txt
  done
}

