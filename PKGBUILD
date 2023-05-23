# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gstreamer
pkgver=1.22.3
pkgrel=1
pkgdesc="GStreamer Multimedia Framework (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
makedepends=('mingw-w64-meson')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2')
options=('!strip' '!buildflags' 'staticlibs')

source=(${url}src/gstreamer/gstreamer-${pkgver}.tar.xz)
sha256sums=('9ffeab95053f9f6995eb3b3da225e88f21c129cd60da002d3f795db70d6d5974')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gstreamer-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D examples=disabled \
      -D doc=disabled \
      -D package-name="GStreamer (Arch Linux)" \
      -D package-origin="http://www.archlinux.org/" ..
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/gstreamer-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/gstreamer-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
