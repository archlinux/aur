# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine-git
_pkgname=symengine
pkgver=r4181.5d123c0
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'arb' 'gperftools') # boost-libs
makedepends=('cmake' 'git' 'boost')
optdepends=('python2')
replaces=('csympy-git')
conflicts=('csympy-git')
source=($_pkgname::git+https://github.com/sympy/symengine.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DWITH_PYTHON:BOOL=ON \
        -DPYTHON_BIN=python2.7 \
        -DWITH_TCMALLOC:BOOL=ON \
        -DWITH_PTHREAD:BOOL=ON \
        -DWITH_SYMENGINE_THREAD_SAFE:BOOL=ON \
        -DWITH_ARB:BOOL=ON #\
#        -DWITH_BOOST:BOOL=ON \
#        -DBoost_NO_BOOST_CMAKE=TRUE \
#        -DBoost_NO_SYSTEM_PATHS=TRUE \
#        -DBOOST_ROOT:PATHNAME=/usr \
#        -DBoost_LIBRARY_DIRS:FILEPATH=/usr/lib
    make
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir" install
}
