pkgname=mingw-w64-libffi
pkgver=3.2.1
pkgrel=2
pkgdesc="Portable foreign function interface library (mingw-w64)"
arch=(any)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
license=(MIT)
url="http://sourceware.org/libffi"
source=("ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz"
"fix_return_size.patch")
sha1sums=('280c265b789e041c02e5c97815793dfc283fb1e6'
          '812beef0a2dc35a834acbeb2fb4bdc04d7abfda0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libffi-${pkgver}"
  patch -p2 -i ../fix_return_size.patch
}

build() {
  cd "${srcdir}/libffi-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --target=${_arch} \
      --enable-pax_emutramp
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libffi-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir/usr/${_arch}/share/info/dir"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
