# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.74.3
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libxml2' 'mingw-w64-libpsl' 'mingw-w64-brotli')
makedepends=('mingw-w64-meson' 'git')
options=(!strip !buildflags staticlibs)
_commit=4a6b9178ded85e269872ffedfb2b18f2754a75d9  # tags/2.74.3^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
