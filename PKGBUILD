# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libffi
pkgver=3.3
pkgrel=1
pkgdesc="Portable foreign function interface library (mingw-w64)"
arch=(any)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
license=(MIT)
url="http://sourceware.org/libffi"
source=(https://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz)
sha256sums=('72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
