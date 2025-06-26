pkgname=mingw-w64-lpsolve
_origname=lp_solve
pkgver=5.5.2.11
_mainver=5.5
pkgrel=1
pkgdesc="a Mixed Integer Linear Programming (MILP) solver (mingw-w64)"
arch=('any')
url="http://lpsolve.sourceforge.net/"
license=('LGPL2.1')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/project/lpsolve/lpsolve/${pkgver}/lp_solve_${pkgver}_source.tar.gz"
        lpsolve-CMakeLists.txt)
sha256sums=('6d4abff5cc6aaa933ae8e6c17a226df0fc0b671c438f69715d41d09fe81f902f'
          SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${_origname}_${_mainver}

  # https://github.com/PADrend/ThirdParty/blob/master/lpsolve-CMakeLists.txt
  cp $srcdir/lpsolve-CMakeLists.txt CMakeLists.txt
}

build() {
  cd ${_origname}_${_mainver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF -B build-${_arch}-static .
    make -C build-${_arch}-static
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_origname}_${_mainver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/${_origname}_${_mainver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
