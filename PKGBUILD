pkgname=mingw-w64-ceres-solver
pkgver=1.14.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems (mingw-w64)"
arch=('any')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
depends=('mingw-w64-lapack' 'mingw-w64-google-glog')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://ceres-solver.org/ceres-solver-1.14.0.tar.gz")
sha256sums=("4744005fc3b902fed886ea418df70690caa8e2ff6b5a90f3dd88a3d291ef8e8e")

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
