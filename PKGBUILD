pkgname=mingw-w64-mpfr
_pkgver=3.1.4
_patchlevel=p4
pkgver=$_pkgver
#.$_patchlevel
pkgrel=1
pkgdesc="Multiple-precision floating-point library (mingw-w64)"
arch=(any)
url="http://www.mpfr.org"
license=("LGPL")
makedepends=('mingw-w64-configure')
depends=("mingw-w64-gmp>=5.0")
options=('staticlibs' '!strip' '!buildflags')
source=("http://www.mpfr.org/mpfr-current/mpfr-${_pkgver}.tar.xz"{,.asc})
md5sums=('064b2c18185038e404a401b830d59be8'
         'SKIP')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/mpfr-$_pkgver
  #patch -p1 -i "$srcdir"/mpfr-${_pkgver}-${_patchlevel}.patch
}

build() {
  cd "$srcdir"/mpfr-${_pkgver}
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
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
