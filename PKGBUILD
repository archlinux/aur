pkgname=mingw-w64-sz
pkgver=2.1.9
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets) (mingw-w64)"
url="https://szcompressor.github.io/homepage/"
license=('custom')
arch=('any')
depends=('mingw-w64-zstd')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/szcompressor/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('491724ff1c0eaaab5e1a7a28e36aba6da9dcbeddb29d8d21a6d1388383d4891e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/SZ-${pkgver}"
  curl -L https://github.com/szcompressor/SZ/pull/59.patch | patch -p1
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/SZ-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
