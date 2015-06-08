pkgname=mingw-w64-mpfr
_pkgver=3.1.2
_patchlevel=p11
pkgver=$_pkgver.$_patchlevel
pkgrel=1
pkgdesc="Multiple-precision floating-point library (mingw-w64)"
arch=(any)
url="http://www.mpfr.org"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=("mingw-w64-gmp>=5.0")
options=(staticlibs !strip !buildflags)
source=("http://www.mpfr.org/mpfr-current/mpfr-${_pkgver}.tar.xz"{,.asc}
"mpfr-3.1.2-p11.patch")
md5sums=('e3d203d188b8fe60bb6578dd3152e05c'
         'SKIP'
         '9f96a5c7cac1d6cd983ed9cf7d997074')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd mpfr-$_pkgver
	patch -p1 -i ../mpfr-3.1.2-p11.patch
}

build() {
  cd mpfr-${_pkgver}
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    $_arch-configure \
      --enable-shared \
      --disable-static \
      --enable-thread-safe
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
		cd "${srcdir}/mpfr-${_pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
