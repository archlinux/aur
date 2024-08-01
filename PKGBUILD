pkgname=mingw-w64-nauty
pkgver=2.8.8
pkgrel=1
pkgdesc="A program for computing automorphism groups of graphs and digraphs (mingw-w64)"
arch=(any)
url="https://pallini.di.uniroma1.it/"
license=(Apache)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=("https://pallini.di.uniroma1.it/nauty${pkgver//./_}.tar.gz")
sha256sums=('159d2156810a6bb240410cd61eb641add85088d9f15c888cdaa37b8681f929ce')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r nauty${pkgver//./_} build-${_arch}
  done
}

build() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-configure --enable-generic .
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    mkdir -p "$pkgdir"/usr/${_arch}/{lib,include/nauty}
    install -m644 nauty.a "$pkgdir"/usr/${_arch}/lib
    install -m644 *.h "$pkgdir"/usr/${_arch}/include/nauty
    popd
  done
}
