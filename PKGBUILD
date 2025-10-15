# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver-git
pkgver=2.2.0.r135.gf9b7b6651
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('cmake' 'git')
depends=('google-glog>=0.3.4' 'eigen>=3.3.4'
      'suitesparse>=4.4.5' 'abseil-cpp')
optdepends=('openmp'
			'cuda: cuda accel for CGNR and dense qr, normal Cholesky and Shur'
			'cudss: cuda accel for sparse normal Cholesky and Schur')
source=("${pkgname}::git+https://github.com/ceres-solver/ceres-solver.git")
sha256sums=('SKIP')
provides=("ceres-solver=${pkgver}")
conflicts=('ceres-solver')
options=('staticlibs')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D EIGENSPARSE=ON'
            '-D BUILD_SHARED_LIBS=ON'
            '-D BUILD_TESTING=OFF'
            '-D BUILD_EXAMPLES=OFF')

pkgver() {
    git -C "${srcdir}/$pkgname" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p ./build
  cd ./build
  cmake ${_cmakeopts[@]} ../ -DLIB_SUFFIX=""
  make
}

package ()
{
  cd "$srcdir/$pkgname/build/"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
