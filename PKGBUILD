pkgname=mingw-w64-libiconv
pkgver=1.14
pkgrel=9
arch=(any)
pkgdesc="Provides GNU libiconv.so and libcharset.so (mingw-w64)"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
license=("LGPL")
url="http://www.gnu.org/software/libiconv/"
source=("http://ftp.gnu.org/pub/gnu/libiconv/libiconv-$pkgver.tar.gz"
         "00-wchar-libiconv-1.14.patch"
         "01-reloc-libiconv-1.14.patch"
         "02-reloc-libiconv-1.14.patch"
         "03-cygwin-libiconv-1.14.patch"
         "libiconv-1.14-2-mingw.patch")
md5sums=('e34509b1623cec449dfeb73d7ce9c6c6'
         '7fe4ced6aa978f0a05b91d85daafce96'
         'da8ba76125096d1dc2a3fa7ded113131'
         '77ba031f3e19ea74f18608711499ba2b'
         '5fa6a6a676d849afc7c01d9ffdd60c5f'
         '9da5e832f3843d6687768be068c2da1b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "$srcdir/libiconv-$pkgver"
  patch -p2 -i ../00-wchar-libiconv-1.14.patch
  patch -p2 -i ../01-reloc-libiconv-1.14.patch
  patch -p2 -i ../02-reloc-libiconv-1.14.patch
  patch -p2 -i ../03-cygwin-libiconv-1.14.patch
  patch -p2 -i ../libiconv-1.14-2-mingw.patch
}

build() {
  cd "$srcdir/libiconv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-nls
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libiconv-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share/
    rm "$pkgdir"/usr/${_arch}/lib/charset.alias
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

