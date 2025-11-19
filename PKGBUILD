# Maintainer SFN
# Contributor xantares
pkgname=ceres-solver-cuda
pkgver=2.2.0
pkgrel=6
pkgdesc="Solver for nonlinear least squares problems, CUDA and CUDSS enabled build"
arch=('x86_64')
url="http://ceres-solver.org/"
license=('Apache-2.0')
depends=('google-glog' 'metis' 'cuda' 'cudss')
makedepends=('cmake' 'ninja' 'eigen')
optdepends=('openmp')
provides=('ceres-solver')
conflicts=('ceres-solver')
source=("http://ceres-solver.org/ceres-solver-${pkgver}.tar.gz")
sha256sums=('48b2302a7986ece172898477c3bcd6deb8fb5cf19b3327bc49969aad4cede82d')

prepare() {
  cd $srcdir/ceres-solver-$pkgver
  # eigen 5.x compat
  sed -i "s|Eigen3 3.3|Eigen3|g" CMakeLists.txt
  sed -i "s|Eigen3 \${CERES_EIGEN_VERSION}|Eigen3|g" cmake/CeresConfig.cmake.in
  sed -i 's|set(CMAKE_CUDA_ARCHITECTURES "50;60;70;80")|set(CMAKE_CUDA_ARCHITECTURES "75;80;90")|g' CMakeLists.txt
}

build() {
  cd ceres-solver-$pkgver
  cmake \
      -Bbuild \
      -GNinja \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_UNITY_BUILD=ON \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBLA_VENDOR=Generic \
      -DEIGENSPARSE=ON \
      -DSUITESPARSE=ON \
      -DGFLAGS=OFF \
      -DUSE_CUDA=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_BENCHMARKS=OFF

  ninja -C build
}

package() {
  cd ceres-solver-$pkgver
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
