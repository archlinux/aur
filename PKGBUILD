pkgname=mingw-w64-libgpg-error
pkgver=1.23
pkgrel=1
pkgdesc="Support library for libgcrypt (mingw-w64)"
arch=(any)
url="http://www.gnupg.org"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-gettext)
options=(staticlibs !strip !buildflags)
source=("ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${pkgver}.tar.bz2"{,.sig}
"02-fix-symbollist-on.mingw.patch"
"05-w32-gen.all.patch"
"07-windows-build.patch")
sha1sums=('c6a0c49211955e924593527b32e4b2736cafcda5'
          'SKIP'
          'a7bbc4637aba322cd43aa7c5a6d99faa8f801133'
          '07f1c34b3861bc2658d1cad4fafe895f654815df'
          '367b3b33da0ae3a8f959ae8535d6584a997ad6b8')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd libgpg-error-$pkgver
	patch -p1 -i ${srcdir}/02-fix-symbollist-on.mingw.patch
	patch -p1 -i ${srcdir}/05-w32-gen.all.patch
  patch -p1 -i ${srcdir}/07-windows-build.patch
  autoreconf -fi
}

build() {
  cd "$srcdir/libgpg-error-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libgpg-error-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
