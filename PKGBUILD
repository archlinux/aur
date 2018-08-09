pkgname=mingw-w64-bzip2
pkgver=1.0.6
pkgrel=8
pkgdesc="A high-quality data compression program (mingw-w64)"
arch=(any)
url="http://sources.redhat.com/bzip2"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
#source=("http://www.bzip.org/${pkgver}/bzip2-${pkgver}.tar.gz"
source=("https://fossies.org/linux/misc/bzip2-${pkgver}.tar.gz"
        "bzip2-1.0.5-autoconfiscated.patch"
        "bzip2-use-cdecl-calling-convention.patch"
        "mingw32-bzip2-1.0.5-slash.patch")
sha1sums=('3f89f861209ce81a6bab1fd1998c0ef311712002'
          '4d512b19b802d328037bf957c18866471c092e84'
          'f73d45bb02741cf0cfa995ac46547b34aedf5343'
          '809c3a95f6f6c26463d804b345d62eed8420c6a6')

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
