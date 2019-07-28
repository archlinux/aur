pkgname=mingw-w64-sz
pkgver=2.1.5.1
pkgrel=1
pkgdesc="Error-bounded Lossy Data Compressor (for floating-point/integer datasets) (mingw-w64)"
url="https://collab.cels.anl.gov/display/ESR/SZ"
license=('custom')
arch=('any')
depends=('mingw-w64-zstd')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/disheng222/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('5234df442714f3400ed5676d2dd151386f6763471e52f784c640f840b8ce40d5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/SZ-${pkgver}"
  sed -i "s|ARCHIVE DESTINATION lib|ARCHIVE DESTINATION lib RUNTIME DESTINATION bin|g" sz/CMakeLists.txt
  
  curl -L https://github.com/disheng222/SZ/commit/360d29e44cf52cc1d59f2b2c070f94ad067f5314.patch | patch -p1
}

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
