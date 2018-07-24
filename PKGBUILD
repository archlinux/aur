# Contributor: jellysheep <max.mail@dameweb.de>

pkgname=mingw-w64-eigen
pkgver=3.3.5
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. (mingw-w64)"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('MPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://bitbucket.org/eigen/eigen/get/${pkgver}.tar.bz2"
        'eigen-3.2_gcc58087.patch')
sha256sums=('7352bff3ea299e4c7d7fbe31c504f8eb9149d7e685dec5a12fbaa26379f603e2'
            'f9471414bc39a19a0a5cd81a1ff65515e2bece3802348cf1f7309215f66ce35a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/eigen-eigen-*
  patch -p1 -i "$srcdir"/eigen-3.2_gcc58087.patch
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

