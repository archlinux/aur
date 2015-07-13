# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine-git
_pkgname=symengine
pkgver=r2144.2b06a0c
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'arb' 'boost-libs' 'gperftools')
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

    sed -i "s/python -c/python2 -c/g" cmake/FindPython.cmake
    sed -i "s/cython /cython2 /g" cmake/FindCython.cmake
        
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DWITH_PYTHON:BOOL=ON \
        -DWITH_ARB:BOOL=ON \
        -DWITH_BOOST:BOOL=ON \
        -DWITH_PTHREAD:BOOL=ON \
        -DWITH_TCMALLOC:BOOL=ON \
        -DWITH_SYMENGINE_THREAD_SAFE:BOOL=ON
    make
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir" install

    mv "$pkgdir"/usr/include/symengine/complex{,_sympy}.h
}
