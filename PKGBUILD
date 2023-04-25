# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsoup3
pkgver=3.4.1
pkgrel=1
pkgdesc="HTTP client/server library (mingw-w64)"
arch=(any)
url="https://download.gnome.org/sources/libsoup"
license=("LGPL")
depends=('mingw-w64-glib2' 'mingw-w64-glib-networking' 'mingw-w64-sqlite' 'mingw-w64-libnghttp2' 'mingw-w64-libpsl' 'mingw-w64-brotli')
makedepends=('mingw-w64-meson' 'git')
options=(!strip !buildflags staticlibs)
_commit=e462f0d71a2f1991ff1921915eb224f00cae5bb1  # tags/3.4.1^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libsoup
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libsoup/build-${_arch}"
    cd "${srcdir}/libsoup/build-${_arch}"
    ${_arch}-meson \
      -D gssapi=disabled \
      -D vapi=disabled \
      -D docs=disabled \
      -D introspection=disabled \
      -D tests=false \
      -D autobahn=disabled \
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
