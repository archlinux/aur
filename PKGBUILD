pkgname=mingw-w64-libmng
pkgver=2.0.3
pkgrel=1
pkgdesc="A collection of routines used to create and manipulate MNG format graphics files (mingw-w64)"
arch=(any)
depends=(mingw-w64-lcms2)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
license=("custom")
url="http://www.libmng.com/"
source=("http://downloads.sourceforge.net/sourceforge/libmng/libmng-${pkgver}.tar.xz"{,.asc}
"libmng-1.0.9-dont-leak-zlib-streams.diff"
"libmng-1.0.10-mingw.patch"
"no-undefined.patch")
sha1sums=('0f141482ffcef6f8cd4413f945a59310ac2e49af'
          'SKIP'
          'd6f2a94cf77cecb4dcca3ee3029016d921608ad7'
          '1cb7bbeb2cc7ab0c4ba2730510cb91b9fc189d29'
          '29ceb317cb9ffce4a36f7662131feb70502231be')
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/libmng-${pkgver}"
	patch -p0 -i "$srcdir"/libmng-1.0.9-dont-leak-zlib-streams.diff
  patch -p1 -i "$srcdir"/libmng-1.0.10-mingw.patch
  patch -p1 -i "$srcdir"/no-undefined.patch
  make distclean
}

build() {
  cd "${srcdir}/libmng-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libmng-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/usr/${_arch}/share"
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
