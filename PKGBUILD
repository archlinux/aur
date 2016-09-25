pkgname=agrum
pkgver=0.9.2
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('GPL')
arch=('i686' 'x86_64')
url="https://forge.lip6.fr/projects/aGrUM/wiki"
depends=('gcc-libs')
optdepends=('python: python bindings')
makedepends=('cmake' 'cococpp' 'swig' 'python')
source=("agrum-${pkgver}::git+git://forge.lip6.fr/aGrUM#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "49i#include <cmath>" src/agrum/core/math/chi2.cpp
  sed -i "36,40d" wrappers/pyAgrum/CMakeLists.txt
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
  popd
  mkdir -p build_py && pushd build_py
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../wrappers/pyAgrum
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  cd "$srcdir/$pkgname-$pkgver/build_py"
  make DESTDIR="$pkgdir" install
}

