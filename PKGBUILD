# Contributor: jellysheep <max.mail@dameweb.de>

pkgname=mingw-w64-eigen
pkgver=3.3.3
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. (mingw-w64)"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('MPL2')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://bitbucket.org/eigen/eigen/get/${pkgver}.tar.bz2"
        'eigen-3.2_gcc58087.patch')
sha1sums=('b676f3f58549104e4f233e1b21354d8be435d8fd'
          '87bc1e62edce393aaa3145f66791abbafff7e08f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/eigen-eigen-*
  patch -p1 -i "$srcdir"/eigen-3.2_gcc58087.patch

  #https://gitlab.kitware.com/cmake/cmake/issues/16509
  sed -i "s|find_package(CUDA|#find_package(CUDA|g" unsupported/test/CMakeLists.txt
}

build() {
  cd "$srcdir"/eigen-eigen-*
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/eigen-eigen-*/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}

