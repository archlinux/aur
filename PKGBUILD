# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: osfans <waxaca@163.com>

_pkgname=marisa
pkgname=mingw-w64-${_pkgname}
pkgver=0.2.6
pkgrel=1
pkgdesc="Static and space-efficient trie data structure library (mingw-w64)"
arch=(any)
url="https://github.com/s-yata/marisa-trie"
license=('LGPL')
makedepends=('git' 'mingw-w64-configure' 'make')
options=(!strip !buildflags staticlibs)
source=(
    "marisa-trie-$pkgver.tar.gz::https://github.com/s-yata/marisa-trie/archive/v$pkgver.tar.gz"
    '001-tools-makefile.patch')
sha1sums=(
    '16d3b28051c2446af7d6ec9a5c6f0b61ab6ba3f6'
    'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/marisa-trie-$pkgver"

  # From https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-marisa/001-tools-makefile.patch
  patch -Np1 -i ../001-tools-makefile.patch

  autoreconf -fi
}

build() {
  cd "$srcdir/marisa-trie-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
      ${_arch}-configure
      make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/marisa-trie-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
