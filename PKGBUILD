# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=csympy-git
pkgver=r1741.8993cc7
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/sympy/csympy.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    sed -i "s/python -c/python2 -c/g" cmake/FindPython.cmake
    sed -i "s/cython /cython2 /g" cmake/FindCython.cmake
        
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DWITH_PYTHON:BOOL=ON
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install

    mv "$pkgdir"/usr/include/complex{,_sympy}.h
}
