# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Anatol Pomozov <anatol.pomozov gmail>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgname=gflags
pkgname=mingw-w64-$_pkgname
pkgver=2.2.2
pkgrel=1
pkgdesc='C++ Library for commandline flag processing (mingw-w64)'
arch=(any)
url='https://github.com/schuhschuh/gflags'
license=('BSD')
makedepends=('mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
_sourcename=${_pkgname}-${pkgver}
source=(${_sourcename}.tar.gz::https://github.com/schuhschuh/gflags/archive/v$pkgver.tar.gz)
sha512sums=('98c4703aab24e81fe551f7831ab797fb73d0f7dfc516addb34b9ff6d0914e5fd398207889b1ae555bac039537b1d4677067dae403b64903577078d99c1bdb447')
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

