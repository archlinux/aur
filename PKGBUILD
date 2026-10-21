pkgname=ceres-solver-lgpl
pkgver=2.2.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems (no SuiteSparse)"
arch=('x86_64')
url="http://ceres-solver.org/"
license=('Apache-2.0')
depends=('google-glog' 'metis')
makedepends=('cmake' 'eigen')
optdepends=('openmp')
conflicts=('ceres-solver')
provides=('ceres-solver')
source=("https://github.com/ceres-solver/ceres-solver/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('12efacfadbfdc1bbfa203c236e96f4d3c210bed96994288b3ff0c8e7c6f350d4')


prepare() {
  cd $srcdir/ceres-solver-$pkgver
  # eigen 5.x compat
  sed -i "s|Eigen3 3.3|Eigen3|g" CMakeLists.txt
  sed -i "s|Eigen3 \${CERES_EIGEN_VERSION}|Eigen3|g" cmake/CeresConfig.cmake.in
}

build() {
  cd ceres-solver-$pkgver
  cmake \
      -Bbuild \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_UNITY_BUILD=ON \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBLA_VENDOR=Generic \
      -DEIGENSPARSE=ON \
      -DSUITESPARSE=OFF \
      -DGFLAGS=OFF \
      -DUSE_CUDA=OFF \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_BENCHMARKS=OFF
  make -C build
}

package() {
  cd ceres-solver-$pkgver
  DESTDIR=$pkgdir make -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
