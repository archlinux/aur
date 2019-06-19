# Contributor: dtag <dtag00@gmail.com>

pkgname=ceres-solver-git
pkgver=r1467.db1f5b57
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('i686' 'x86_64')
url="http://ceres-solver.org/"
license=('LGPL')
makedepends=('cmake')
depends=('google-glog>=0.3.4' 'eigen>=3.3.4'
      'suitesparse>=4.4.5')
optdepends=('openmp')
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
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
