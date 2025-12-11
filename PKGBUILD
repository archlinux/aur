pkgname=mingw-w64-ceres-solver
pkgver=2.2.0
pkgrel=9
pkgdesc="Solver for nonlinear least squares problems (mingw-w64)"
arch=('any')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-lapack' 'mingw-w64-google-glog' 'mingw-w64-suitesparse' 'mingw-w64-eigen')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://ceres-solver.org/ceres-solver-${pkgver}.tar.gz")
sha256sums=('48b2302a7986ece172898477c3bcd6deb8fb5cf19b3327bc49969aad4cede82d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $srcdir/ceres-solver-$pkgver
  # eigen 5.x compat
  sed -i "s|Eigen3 3.3|Eigen3|g" CMakeLists.txt
  sed -i "s|Eigen3 \${CERES_EIGEN_VERSION}|Eigen3|g" cmake/CeresConfig.cmake.in

  # drop old eigen bug workaround
  sed -i "s|if (MINGW)|if (0)|g" CMakeLists.txt
}

build() {
  cd $srcdir/ceres-solver-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_UNITY_BUILD=ON \
      -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DBUILD_BENCHMARKS=OFF -DGFLAGS=OFF -DBLA_VENDOR=Generic -B build-${_arch} .
    make -C build-${_arch}
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
