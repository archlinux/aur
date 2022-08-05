# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-ugly
pkgver=1.20.3
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base')
makedepends=('mingw-w64-meson' 'mingw-w64-x264' 'mingw-w64-opencore-amr')
optdepends=(
  "mingw-w64-x264: H.264 video encoder plugin"
  "mingw-w64-opencore-amr: Adaptive Multi-Rate Narrow-Band audio codec plugin"
)

options=('!strip' '!buildflags' 'staticlibs')

source=(${url}src/gst-plugins-ugly/gst-plugins-ugly-${pkgver}.tar.xz)
sha256sums=('8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/gst-plugins-ugly-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D package-name="GStreamer (Arch Linux)" \
      -D package-origin="http://www.archlinux.org/" ..
    ninja
    popd
  done
}


package() {
  cd "${srcdir}/gst-plugins-ugly-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/gst-plugins-ugly-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
