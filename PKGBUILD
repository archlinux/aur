pkgname=mingw-w64-miniz
pkgver=3.1.2
pkgrel=1
pkgdesc='Compression library implementing zlib (RFC 1950) & deflate (RFC 1951) specifications (mingw-w64)'
arch=('any')
url='https://github.com/richgel999/miniz'
license=(MIT)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/richgel999/miniz/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('98468f8924934b723276680f85238b6c78bf1f8b49b4459cc9b7214a20e2e9fb')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "$srcdir/$pkgname"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/$pkgname"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
