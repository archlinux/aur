# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gstreamer
pkgver=1.20.5
pkgrel=1
pkgdesc="GStreamer Multimedia Framework (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
makedepends=('mingw-w64-meson')
depends=('mingw-w64-glib2' 'mingw-w64-libxml2')
options=('!strip' '!buildflags' 'staticlibs')

source=(${url}src/gstreamer/gstreamer-${pkgver}.tar.xz)
sha256sums=('5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff')

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
