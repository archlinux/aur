# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.68.2
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL2")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libxml2' 'mingw-w64-libpsl')
makedepends=('mingw-w64-meson')
options=(!strip !buildflags staticlibs)
source=("http://download.gnome.org/sources/libsoup/${pkgver%.*}/libsoup-$pkgver.tar.xz")
sha256sums=('51ad3001a946fe3bcf29b692dc9ffe05cdf702ea6ca0ee8c3099a99a2f4e3933')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libsoup-${pkgver}/build-${_arch}"
    cd "${srcdir}/libsoup-${pkgver}/build-${_arch}"
    ${_arch}-meson \
      -D gssapi=disabled \
      -D gnome=false \
      -D vapi=disabled \
      -D gtk_doc=false \
      -D introspection=disabled \
      -D tests=false \
      -D tls_check=false \
      --default-library both ..
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/libsoup-${pkgver}/build-${_arch}" install
  
    # see https://github.com/mesonbuild/meson/issues/4138 
    ${_arch}-gcc-ranlib ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
