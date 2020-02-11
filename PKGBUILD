# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine
pkgver=0.6.0
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'gperftools' 'flint' 'libmpc')
makedepends=('cmake' 'llvm')
optdepends=('llvm-libs' 'zlib')
replaces=('csympy-git')
conflicts=('csympy-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/sympy/symengine/archive/v$pkgver.tar.gz)
sha256sums=('4d2caa86c03eaaa8ed004084d02f87b5c51b6229f8ba70d161227e22d6302f0a')

build() {
  cd $pkgname-$pkgver

  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DWITH_TCMALLOC:BOOL=ON \
    -DWITH_PTHREAD:BOOL=ON \
    -DWITH_SYMENGINE_THREAD_SAFE:BOOL=ON \
    -DWITH_ARB:BOOL=OFF \
    -DWITH_GMP=on \
    -DWITH_MPFR=on \
    -DWITH_MPC=on \
    -DINTEGER_CLASS=flint \
    -DWITH_LLVM=on \
    -DWITH_BOOST:BOOL=ON
  make
}

check() {
  cd $pkgname-$pkgver/build
  make test
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
