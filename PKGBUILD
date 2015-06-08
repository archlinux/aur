pkgname=agrum
pkgver=0.9.1
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
  sed -i "s|print sysconfig.get_python_lib(1,0,prefix='\${CMAKE_INSTALL_PREFIX}')|print(sysconfig.get_python_lib(1,0,prefix='\${CMAKE_INSTALL_PREFIX}'))|g" wrappers/pyAgrum/CMakeLists.txt

  # see 6b89d669e8f5086f4de6ad8a4e34385080073b26
  sed -i "s|<< traceFileName <<|<< traceFileName.str() <<|g" src/agrum/FMDP/planning/SPUDDPlanning.tcc
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

