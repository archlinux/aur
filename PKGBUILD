# Maintainer: osfans <waxaca@163.com>
_pkgname=marisa
pkgname=mingw-w64-${_pkgname}
pkgver=0.2.4
pkgrel=1
pkgdesc="Static and space-efficient trie data structure library (mingw-w64)"
arch=(any)
url="https://code.google.com/p/marisa-trie"
license=('LGPL')
makedepends=('git' 'mingw-w64-configure' 'make')
options=(!strip !buildflags staticlibs)
source=("https://marisa-trie.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
sha1sums=('fb0ed7d993e84dff32ec456a79bd36a00022629d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
      ${_arch}-configure --enable-shared=no --enable-static=yes
      make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/$_pkgname-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
