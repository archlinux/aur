pkgname=mingw-w64-nauty
pkgver=2.8.9
pkgrel=1
pkgdesc="A program for computing automorphism groups of graphs and digraphs (mingw-w64)"
arch=(any)
url="https://pallini.di.uniroma1.it"
license=(Apache)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=("${url}/nauty${pkgver//./_}.tar.gz")
sha256sums=('c97ab42bf48796a86a598bce3e9269047ca2b32c14fc23e07208a244fe52c4ee')
#source=("http://users.cecs.anu.edu.au/~bdm/nauty/nauty2_8_9.tar.gz")


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd nauty${pkgver//./_}
  # popcnt check fails without wine
  sed -i "6041,6072d" configure

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
