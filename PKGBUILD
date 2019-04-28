# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libnice
pkgver=0.1.15
pkgrel=2
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (mingw-w64)"
arch=(any)
url="https://nice.freedesktop.org"
license=('LGPL')
makedepends=('mingw-w64-meson' 'git' 'mingw-w64-gstreamer')
depends=('mingw-w64-glib2' 'mingw-w64-gnutls')
options=('!strip' '!buildflags' 'staticlibs')

_commit=e25c3e5113c7b7002a78bcca2ecf058bbf7de6d4  # tags/0.1.15^0
source=("git+https://gitlab.freedesktop.org/libnice/libnice.git#commit=$_commit"
  "0001-nicesrc-spin-the-agent-mainloop-in-a-separate-thread.patch")
sha256sums=('SKIP'
  '9413dc1b9b681b6e5c274db0267aa4c3bf88b360d0f58edf73f1bad365243f30')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libnice"
  patch -Np1 -i "$srcdir/0001-nicesrc-spin-the-agent-mainloop-in-a-separate-thread.patch"
}

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
