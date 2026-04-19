pkgname=mingw-w64-nauty
pkgver=2.9.3
pkgrel=1
pkgdesc="A program for computing automorphism groups of graphs and digraphs (mingw-w64)"
arch=(any)
url="https://pallini.di.uniroma1.it"
license=(Apache)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=("${url}/nauty${pkgver//./_}.tar.gz")
sha256sums=('9fc4edae04f88a0f5883985be3b39cf7f898fd6cc96e96b9ee25452743cc1b5b')
#source=("http://users.cecs.anu.edu.au/~bdm/nauty/nauty2_8_9.tar.gz")


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd nauty${pkgver//./_}
  # popcnt,lzcnt checks fail in cross-compile mode
  sed -i "6383,6435d" configure
  sed -i "6594,6642d" configure

  cd "$srcdir"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r nauty${pkgver//./_} build-${_arch}
  done
}

build() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-configure --enable-generic .
    sed -i "s|#define HAVE_HWLZCNT|#define HAVE_HWLZCNT 0|g" nauty.h
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    install -d "$pkgdir"/usr/${_arch}/{lib,include/nauty}
    install -m644 nauty*.a "$pkgdir"/usr/${_arch}/lib
    install -m644 *.h "$pkgdir"/usr/${_arch}/include/nauty
  done
}
