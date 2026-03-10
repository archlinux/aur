pkgname=mingw-w64-lpsolve
_origname=lp_solve
pkgver=5.5.2.14
pkgrel=1
pkgdesc="a Mixed Integer Linear Programming (MILP) solver (mingw-w64)"
arch=('any')
url="https://lp-solve.github.io/"
license=('LGPL-2.1-or-later'
         'GPL-2.0-or-later WITH Bison-exception-2.2'
         'BSD-3-Clause')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/lp-solve/lp_solve/releases/download/${pkgver}/lp_solve_${pkgver}_source.tar.gz
        lpsolve-CMakeLists.txt)
sha256sums=('a4bbdc881128bdbe920a38e134c9add5db47f9aa814a0a018ba940b0f3c278c3'
          SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${_origname}

  # https://github.com/PADrend/ThirdParty/blob/master/lpsolve-CMakeLists.txt
  cp $srcdir/lpsolve-CMakeLists.txt CMakeLists.txt
}

build() {
  cd ${_origname}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DLPSOLVE_CLI=OFF -DBUILD_SHARED_LIBS=OFF -B build-${_arch}-static .
    make -C build-${_arch}-static
    ${_arch}-cmake -DLPSOLVE_CLI=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_origname}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/${_origname}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
