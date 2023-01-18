# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libnice
pkgver=0.1.21
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (mingw-w64)"
arch=(any)
url="https://nice.freedesktop.org"
license=('LGPL')
makedepends=('mingw-w64-meson' 'git' 'mingw-w64-gstreamer')
depends=('mingw-w64-glib2' 'mingw-w64-gnutls')
options=('!strip' '!buildflags' 'staticlibs')

_commit=3d9cae16a5094aadb1651572644cb5786a8b4e2d  # tags/0.1.21^0
source=("git+https://gitlab.freedesktop.org/libnice/libnice.git#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libnice"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D tests=disabled \
      -D examples=disabled \
      -D gupnp=disabled \
      -D gstreamer=enabled \
      -D crypto-library=gnutls \
      -D introspection=disabled \
      -D gtk_doc=disabled
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/libnice"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/libnice/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
