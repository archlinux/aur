# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.66.0
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL2")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libxml2' 'mingw-w64-libpsl')
makedepends=('mingw-w64-meson')
options=(!strip !buildflags staticlibs)
source=("http://download.gnome.org/sources/libsoup/${pkgver%.*}/libsoup-$pkgver.tar.xz"
  "https://gitlab.gnome.org/GNOME/libsoup/merge_requests/52.diff")
sha256sums=('51adc2ad6c8c670cf6339fcfa88190a3b58135a9cddd21f623a0f80fdb9c8921'
  'c167afadbf9fdca57b1d211fd6b3a357c9290f0f85b067b955f6a56af7dbf660')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "libsoup-$pkgver"
  patch -Np1 -i "$srcdir/52.diff"
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libsoup-${pkgver}/build-${_arch}"
    cd "${srcdir}/libsoup-${pkgver}/build-${_arch}"
    ${_arch}-meson \
      -D gssapi=false \
      -D gnome=false \
      -D vapi=false \
      -D doc=false \
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
