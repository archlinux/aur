pkgname=mingw-w64-libharu
pkgver=2.4.1
pkgrel=1
pkgdesc="C library for generating PDF documents (mingw-w64)"
url="https://github.com/libharu/libharu"
arch=('any')
license=('custom:ZLIB')
depends=('mingw-w64-zlib' 'mingw-w64-libpng')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/libharu/libharu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1af88a3b53af0b322c5af207935aefaf5b18847da4b70826725f18465fd43ec9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libharu-${pkgver}"
  # restore version header
  curl -L https://github.com/libharu/libharu/commit/d75f9fa2519fa31bde7775523042771e6c02bde7.patch | patch -p1
  curl -L https://github.com/libharu/libharu/pull/239.patch | patch -p1
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

