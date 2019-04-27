# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-bad
pkgver=1.16.0
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base' 'mingw-w64-orc')
makedepends=('mingw-w64-meson' 'mingw-w64-openh264' 'mingw-w64-nettle' 'mingw-w64-opus' 'mingw-w64-bzip2' 'mingw-w64-libsrtp' 'mingw-w64-vo-aacenc' 'mingw-w64-libkate' 'mingw-w64-librsvg' 'mingw-w64-openjpeg2' 'mingw-w64-opencv' 'mingw-w64-libfdk-aac' 'mingw-w64-librtmp0' 'mingw-w64-libwebp' 'mingw-w64-srt' 'mingw-w64-curl')
optdepends=(
  "mingw-w64-openh264: H.264 video codec plugin"
  "mingw-w64-opus: OPUS audio parser plugin"
  "mingw-w64-libsrtp: Secure RTP codec plugin"
  "mingw-w64-vo-aacenc: AAC audio encoder plugin"
  "mingw-w64-libkate: Kate subtitle parser, tagger, and codec plugin"
  "mingw-w64-librsvg: SVG overlayer and image decoder plugin"
  "mingw-w64-openjpeg2: JPEG2000 image codec plugin"
  "mingw-w64-opencv: OpenCV computer vision library support"
  "mingw-w64-libfdk-aac: Fraunhofer AAC audio codec plugin"
  "mingw-w64-librtmp0: RTMP video network source and sink plugin"
  "mingw-w64-srt: Secure, Reliable, Transport client/server network source/sink plugin"
  "mingw-w64-curl: cURL network source and sink plugin"
  "mingw-w64-bzip2: bz2 stream encoder and decoder plugin"
)
options=('!strip' '!buildflags' 'staticlibs')

source=(${url}src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz
  'https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/merge_requests/306.diff')
sha256sums=('22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05'
  'ef341d3e6c45292be59d153cda9052a85c1cc8ba7dbe7f8dad7abd63e728b591')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  patch -Np1 -i "$srcdir/306.diff"
}

build() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
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
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/gst-plugins-bad-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
