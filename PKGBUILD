pkgname=mingw-w64-libb2
pkgver=0.98.1
pkgrel=1
pkgdesc="C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp hash functions"
arch=('any')
url='https://blake2.net/'
license=('custom:CC0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/BLAKE2/libb2/releases/download/v$pkgver/libb2-$pkgver.tar.gz")
sha256sums=('53626fddce753c454a3fea581cbbc7fe9bbcf0bc70416d48fdbbf5d87ef6c72e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/libb2-${pkgver}
    for _arch in ${_architectures}; do
      mkdir -p build-${_arch} && pushd build-${_arch}
      ${_arch}-configure ax_cv_have_mmx_ext=yes \
        ax_cv_have_sse_ext=yes ax_cv_have_sse2_ext=yes \
        ax_cv_have_sse3_ext=no ax_cv_have_ssse3_ext=no \
        ax_cv_have_sse41_ext=no ax_cv_have_sse42_ext=no \
        ax_cv_have_avx_ext=no ..
      make
      popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libb2-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
