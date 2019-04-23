# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.66.1
pkgrel=2
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL2")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libxml2' 'mingw-w64-libpsl')
makedepends=('mingw-w64-meson')
options=(!strip !buildflags staticlibs)
source=("http://download.gnome.org/sources/libsoup/${pkgver%.*}/libsoup-$pkgver.tar.xz"
  "https://gitlab.gnome.org/GNOME/libsoup/merge_requests/60.diff")
sha256sums=('4a2cb6c1174540af13661636035992c2b179dfcb39f4d3fa7bee3c7e355c43ff'
  'efff1ff4ea58390b5c96c9bd8e8fbdb9c3d7499aaa52b00c0ff3e37fb6a47807')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "libsoup-$pkgver"
  patch -Np1 -i "$srcdir/60.diff"
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
