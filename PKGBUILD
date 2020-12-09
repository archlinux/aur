pkgname=mingw-w64-ceres-solver
pkgver=2.0.0
pkgrel=2
pkgdesc="Solver for nonlinear least squares problems (mingw-w64)"
arch=('any')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-lapack' 'mingw-w64-google-glog' 'mingw-w64-suitesparse' 'mingw-w64-eigen')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://ceres-solver.org/ceres-solver-${pkgver}.tar.gz")
sha256sums=('10298a1d75ca884aa0507d1abb0e0f04800a92871cd400d4c361b56a777a7603')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd $srcdir/ceres-solver-$pkgver
  sed -i "s|set(RELATIVE_CMAKECONFIG_INSTALL_DIR CMake)|set(RELATIVE_CMAKECONFIG_INSTALL_DIR lib/cmake/Ceres)|g" CMakeLists.txt
}

build() {
  cd $srcdir/ceres-solver-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DEIGEN_INCLUDE_DIR_HINTS=/usr/${_arch}/include \
      -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DBUILD_BENCHMARKS=OFF ..
    make
    popd
  done
}

package ()
{
  for _arch in ${_architectures}; do
    cd "${srcdir}/ceres-solver-$pkgver/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
