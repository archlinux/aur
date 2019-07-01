pkgname=mingw-w64-bzip2
pkgver=1.0.7
pkgrel=1
pkgdesc="A high-quality data compression program (mingw-w64)"
arch=(any)
url="http://www.sourceware.org/bzip2/"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
#source=("http://www.bzip.org/${pkgver}/bzip2-${pkgver}.tar.gz"
source=("https://fossies.org/linux/misc/bzip2-${pkgver}.tar.gz"
        "bzip2-1.0.5-autoconfiscated.patch"
        "bzip2-use-cdecl-calling-convention.patch"
        "mingw32-bzip2-1.0.5-slash.patch")
sha256sums=('e768a87c5b1a79511499beb41500bcc4caf203726fff46a6f5f9ad27fe08ab2b'
            '7daaca73a46af4636843d1d13bca9cec6e38c0932142a420ad3500098a90db11'
            '8f8f0b65417fe892152e1f0a4f75090d2ef1845d5a611c3c94493704d53452ef'
            '672216b20cf29438ffe43ebf38b9a648d9a0ac6fdc6be55bb4181d57ed5462be')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/bzip2-$pkgver"
  rm -f autogen.sh README.autotools configure.ac Makefile.am bzip2.pc.in
  patch -p1 -i "$srcdir/"bzip2-1.0.5-autoconfiscated.patch
  patch bzlib.h < "$srcdir/"bzip2-use-cdecl-calling-convention.patch
  patch bzip2.c < "$srcdir/"mingw32-bzip2-1.0.5-slash.patch
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
