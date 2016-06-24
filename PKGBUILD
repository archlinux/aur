pkgname=mingw-w64-pcre
pkgver=8.39
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (mingw-w64)"
arch=(any)
url="http://www.pcre.org/"
license=("BSD")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$pkgver.tar.bz2"{,.sig})
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
md5sums=('e3fca7650a0556a2647821679d81f585'
         'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "$srcdir/pcre-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-unicode-properties \
      --enable-jit \
      --enable-pcre16 \
      --enable-pcre32
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pcre-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
