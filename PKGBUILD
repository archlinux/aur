# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup
pkgver=2.70.0
pkgrel=2
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libxml2' 'mingw-w64-libpsl')
makedepends=('mingw-w64-meson' 'git' 'mingw-w64-environment')
options=(!strip !buildflags staticlibs)
_commit=3857ea93dd3775d68010efed7ad3245714fee379  # tags/2.70.0^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libsoup/build-${_arch}"
    cd "${srcdir}/libsoup/build-${_arch}"
    unset CPPFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    # workaround to fix build with gcc 10
    export CFLAGS="-fcommon"
    source mingw-env ${_arch}
    meson-cross-file-generator --arch ${_arch} --output-file cross_file
    export CROSS_FILE=${srcdir}/libsoup/build-${_arch}/cross_file
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
