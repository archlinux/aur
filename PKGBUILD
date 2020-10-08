# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.72.0
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libxml2' 'mingw-w64-libpsl' 'mingw-w64-brotli')
makedepends=('mingw-w64-meson' 'git')
options=(!strip !buildflags staticlibs)
_commit=ae1632c176c60b7fe832024c0a958f4079767c44  # tags/2.72.0^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit"
  "libsoup_extern.patch")
sha256sums=('SKIP'
  '10ade43ee9a2bcfb177539c59e39e01984d7f96c09110173cec3d675aa0f410e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd libsoup 
  # # Fix mulitple definition errors
  patch -Np1 -i ../libsoup_extern.patch
}


build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libsoup/build-${_arch}"
    cd "${srcdir}/libsoup/build-${_arch}"
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
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/libsoup/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
