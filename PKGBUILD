# Maintainer: drakkan <nicola.murino@gmail.com>
pkgname=mingw-w64-libsoup
pkgver=2.56.0
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-glib2 mingw-w64-glib-networking mingw-w64-libxml2 mingw-w64-sqlite)
options=(!strip !buildflags staticlibs)
source=("http://ftp.gnome.org/pub/GNOME/sources/libsoup/${pkgver%.*}/libsoup-$pkgver.tar.xz")
sha256sums=('d8216b71de8247bc6f274ec054c08547b2e04369c1f8add713e9350c8ef81fe5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libsoup-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-gnome \
      --disable-more-warnings \
      --with-gssapi=no
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libsoup-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
