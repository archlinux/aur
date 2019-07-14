pkgname=mingw-w64-bzip2
pkgver=1.0.8
pkgrel=1
pkgdesc="A high-quality data compression program (mingw-w64)"
arch=(any)
url="http://www.sourceware.org/bzip2/"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("https://sourceware.org/pub/bzip2/bzip2-${pkgver}.tar.gz"
        "bzip2-1.0.5-autoconfiscated.patch"
        "bzip2-use-cdecl-calling-convention.patch")
sha256sums=('ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
            '7daaca73a46af4636843d1d13bca9cec6e38c0932142a420ad3500098a90db11'
            '8f8f0b65417fe892152e1f0a4f75090d2ef1845d5a611c3c94493704d53452ef')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/bzip2-$pkgver"
  rm -f autogen.sh README.autotools configure.ac Makefile.am bzip2.pc.in
  patch -p1 -i "$srcdir/"bzip2-1.0.5-autoconfiscated.patch
  patch bzlib.h < "$srcdir/"bzip2-use-cdecl-calling-convention.patch
  sh autogen.sh
}

build() {
  cd "$srcdir/bzip2-$pkgver" 
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd 
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/bzip2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir/usr/${_arch}/bin/bz"{diff,grep,more}
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
