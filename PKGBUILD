pkgname=mingw-w64-sz
pkgver=2.1.11
pkgrel=1
pkgdesc="Modular parametrizable lossy compressor framework for scientific data (mingw-w64)"
url="https://szcompressor.org"
license=(BSD)
arch=('any')
depends=('mingw-w64-zstd')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/szcompressor/SZ/archive/v${pkgver}.tar.gz")
sha256sums=('85b8ef99344a3317ba9ee63ca4b9d99a51d1832d4d8880e01c7c56b3a69cacc9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/SZ-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_FORTRAN=ON ..
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
