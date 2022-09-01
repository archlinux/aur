pkgname=mingw-w64-libharu
pkgver=2.4.0
pkgrel=1
pkgdesc="C library for generating PDF documents (mingw-w64)"
url="https://github.com/libharu/libharu"
arch=('any')
license=('custom:ZLIB')
depends=('mingw-w64-zlib' 'mingw-w64-libpng')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/libharu/libharu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1c38c0492257c61fb60c85238d500c05184fd8e9e68fecba9cf304ff2d8726d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libharu-${pkgver}"
  rm .github/workflows/cmake.yml
  curl -L  https://github.com/libharu/libharu/pull/236.patch | patch -p1
  rm .github/workflows/cmake.yml
  curl -L  https://github.com/libharu/libharu/pull/234.patch | patch -p1
}

build() {
  cd "$srcdir/libharu-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libharu-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

