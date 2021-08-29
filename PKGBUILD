pkgname=mingw-w64-svt-hevc
pkgver=1.5.1
pkgrel=1
pkgdesc="The Scalable Video Technology for HEVC Encoder (SVT-HEVC Encoder) is an HEVC-compliant encoder library core. (mingw-w64)"
arch=('any')
url="https://github.com/OpenVisualCloud/SVT-HEVC"
license=('GPL')
depends=(mingw-w64-crt)
makedepends=('mingw-w64-cmake' 'yasm')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/OpenVisualCloud/SVT-HEVC/archive/v${pkgver}.tar.gz")
sha256sums=('fcadf3a326e012bdc7d7357b55573b45dfd37bf4a4186c93ed1c4b98fe3f1f6d')

_architectures="x86_64-w64-mingw32"

build() {
  cd "$srcdir/SVT-HEVC-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE='Release' ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/SVT-HEVC-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
