# Maintainer: kino <cybao292261@163.com>
# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver-legacy
pkgver=1.14.0
pkgrel=5
pkgdesc="Solver for nonlinear least squares problems. Legacy version needed for google cartographer"
arch=('i686' 'x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('cmake' 'eigen>=3.3.0')
depends=('google-glog>=0.3.4' 'suitesparse>=4.4.5')
optdepends=('openmp')
provides=(ceres-solver)
conflicts=(ceres-solver)

source=("http://ceres-solver.org/ceres-solver-${pkgver}.tar.gz"
        "ceres-solver-fix-cmake-findtbb.patch")
sha256sums=('4744005fc3b902fed886ea418df70690caa8e2ff6b5a90f3dd88a3d291ef8e8e'
            '6166866bf678ac26acaf0c95279c02a039652856f924b2782dff4d46bb39402b')
options=('staticlibs')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D EIGENSPARSE=ON'
            '-D CXX11=ON'
            '-D BUILD_SHARED_LIBS=ON'
            '-D BUILD_TESTING=OFF'
            '-D BUILD_EXAMPLES=OFF')

prepare() {
  cd $srcdir/ceres-solver-$pkgver
  patch -p1 < ../ceres-solver-fix-cmake-findtbb.patch
}

build() {
  cd $srcdir/ceres-solver-$pkgver

  mkdir -p ./build
  cd ./build
  cmake ${_cmakeopts[@]} ../ -DLIB_SUFFIX=""
  make
}

package() {
  cd $srcdir/ceres-solver-$pkgver/build/
  make DESTDIR=$pkgdir install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
