pkgname=mingw-w64-pcre
pkgver=8.37
pkgrel=2
pkgdesc="A library that implements Perl 5-style regular expressions (mingw-w64)"
arch=(any)
url="http://www.pcre.org/"
license=("BSD")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$pkgver.tar.bz2"{,.sig}
"01-seven-security-patches.patch")
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel
md5sums=('ed91be292cb01d21bc7e526816c26981'
         'SKIP'
         '45df6737e61738cc8bb061e0b9c0fbb2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	patch -p1 -d pcre-$pkgver < 01-seven-security-patches.patch
}

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
