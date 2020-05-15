pkgname=mingw-w64-md4c
pkgver=0.4.3
pkgrel=1
pkgdesc="C Markdown parser (mingw-w64)"
arch=(any)
url="https://github.com/mity/md4c"
license=(MIT)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/mity/md4c/archive/release-$pkgver.tar.gz")
sha256sums=('3486c2bd3fd64a8237f7835d9d1c60ea8a362f1910cb1c64f001971220476a4a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build () {
  cd "md4c-release-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
for _arch in ${_architectures}; do
    cd "$srcdir/md4c-release-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
