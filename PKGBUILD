pkgname=mingw-w64-nauty
pkgver=26r12
pkgrel=1
pkgdesc="A program for computing automorphism groups of graphs and digraphs (mingw-w64)"
arch=(any)
url="http://pallini.di.uniroma1.it/"
license=(Apache)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=("http://pallini.di.uniroma1.it/nauty$pkgver.tar.gz")
sha256sums=('862ae0dc3656db34ede6fafdb0999f7b875b14c7ab4fedbb3da4f28291eb95dc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r nauty$pkgver build-${_arch}
    # lib prefix + use arch-ar 
    sed -i "s|ar crs |${_arch}-ar crs lib|g" build-${_arch}/makefile.in
  done
  
}

build() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-configure .
    make
    ${_arch}-ranlib *.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    mkdir -p "$pkgdir"/usr/${_arch}/{lib,include/nauty}
    install -m644 *.a "$pkgdir"/usr/${_arch}/lib
    install -m644 *.h "$pkgdir"/usr/${_arch}/include/nauty
    popd
  done
}
