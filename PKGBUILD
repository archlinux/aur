pkgname=mingw-w64-sz
pkgver=2.1.5.3
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets) (mingw-w64)"
url="https://collab.cels.anl.gov/display/ESR/SZ"
license=('custom')
arch=('any')
depends=('mingw-w64-zstd')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('d73e024da2095612c27a815fd6eb31cca24f566c9cdd6add74eabc08bba7d70d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/SZ-${pkgver}"
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
