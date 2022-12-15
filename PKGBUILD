pkgname=mingw-w64-ceres-solver
pkgver=2.1.0
pkgrel=3
pkgdesc="Solver for nonlinear least squares problems (mingw-w64)"
arch=('any')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-lapack' 'mingw-w64-google-glog' 'mingw-w64-suitesparse' 'mingw-w64-eigen')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://ceres-solver.org/ceres-solver-${pkgver}.tar.gz")
sha256sums=('f7d74eecde0aed75bfc51ec48c91d01fe16a6bf16bce1987a7073286701e2fc6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/ceres-solver-$pkgver
  curl -L https://github.com/ceres-solver/ceres-solver/commit/352b320ab1b5438a0838aea09cbbf07fa4ff5d71.patch | patch -p1
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DBUILD_BENCHMARKS=OFF -DGFLAGS=OFF ..
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
