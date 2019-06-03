# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine-git
_pkgname=${pkgname%-git}
pkgver=0.4.0.r27.g72e2f22a
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'gperftools' 'boost-libs') # arb
makedepends=('cmake' 'git' 'boost')
replaces=('csympy-git')
conflicts=('csympy-git' 'symengine')
provides=('symengine')
source=(git+https://github.com/sympy/symengine.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd $_pkgname

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
    -DWITH_BOOST:BOOL=ON
  make
}

check() {
  cd $_pkgname/build
  make test
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
