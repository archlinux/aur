# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.60.3
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-libxml2' 'mingw-w64-sqlite')
makedepends=('mingw-w64-configure' 'intltool')
options=(!strip !buildflags staticlibs)
source=("http://ftp.gnome.org/pub/GNOME/sources/libsoup/${pkgver%.*}/libsoup-$pkgver.tar.xz")
sha256sums=('1b0dc762f23abe4e0d29b77370e539fd35f31d8e8e0318d6ddccff395be68a22')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libsoup-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-gnome \
      --disable-more-warnings \
      --disable-vala \
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
