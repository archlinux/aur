pkgname=mingw-w64-pcre2
pkgver=10.34
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (mingw-w64)'
arch=('any')
url='https://www.pcre.org/'
license=('BSD')
makedepends=(mingw-w64-configure mingw-w64-readline mingw-w64-bzip2 mingw-w64-zlib)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
optdepends=(mingw-w64-readline mingw-w64-bzip2 mingw-w64-zlib)
source=("https://ftp.pcre.org/pub/pcre/${pkgname##mingw-w64-}-$pkgver.tar.bz2"{,.sig})
sha512sums=('77ad75f8b0b8bbfc2f57932596151bca25b06bd621e0f047e476f38cd127f43e2052460b95c281a7e874aad2b7fd86c8f3413f4a323abb74b9440a42d0ee9524'
            'SKIP')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8')  # Philip Hazel

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/${pkgname##mingw-w64-}-$pkgver"
}

build() {
  cd "$srcdir/${pkgname##mingw-w64-}-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-jit \
      --enable-pcre2-16 \
      --enable-pcre2-32 \
      --enable-pcre2grep-libz \
      --enable-pcre2grep-libbz2 \
      --enable-pcre2test-libreadline
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname##mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
