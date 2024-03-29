# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-bad
pkgver=1.24.1
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base' 'mingw-w64-orc')
makedepends=('mingw-w64-meson' 'mingw-w64-directxmath' 'mingw-w64-openh264' 'mingw-w64-nettle' 'mingw-w64-opus' 'mingw-w64-bzip2' 'mingw-w64-libsrtp' 'mingw-w64-libkate' 'mingw-w64-librsvg' 'mingw-w64-openjpeg2' 'mingw-w64-opencv' 'mingw-w64-libfdk-aac' 'mingw-w64-librtmp0' 'mingw-w64-libwebp' 'mingw-w64-srt' 'mingw-w64-curl' 'mingw-w64-libnice')
optdepends=(
  "mingw-w64-openh264: H.264 video codec plugin"
  "mingw-w64-opus: OPUS audio parser plugin"
  "mingw-w64-libsrtp: Secure RTP codec plugin"
  "mingw-w64-libkate: Kate subtitle parser, tagger, and codec plugin"
  "mingw-w64-librsvg: SVG overlayer and image decoder plugin"
  "mingw-w64-openjpeg2: JPEG2000 image codec plugin"
  "mingw-w64-opencv: OpenCV computer vision library support"
  "mingw-w64-libfdk-aac: Fraunhofer AAC audio codec plugin"
  "mingw-w64-librtmp0: RTMP video network source and sink plugin"
  "mingw-w64-srt: Secure, Reliable, Transport client/server network source/sink plugin"
  "mingw-w64-curl: cURL network source and sink plugin"
  "mingw-w64-bzip2: bz2 stream encoder and decoder plugin"
  "mingw-w64-libnice: WebRTC audio/video network bin plugin"
)
options=('!strip' '!buildflags' 'staticlibs')

source=(${url}src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz
  0001-fix-DirectXMath-detection.patch)
sha256sums=('f1a183966ea9136a00f159ee42db4d1d106abef022d1b49e63fba2fcbe50c8f8'
  '3eee4a3e2751d6fc24852b6cf27d42e660858d02ec31620fb1f3a2ecebb4923a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-fix-DirectXMath-detection.patch"
}


build() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  sed -i "s|link_args : \[noseh_link_args, '-lopencv_tracking'\],|link_args : \[noseh_link_args\],|" ext/opencv/meson.build
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D strip=true \
      -D package-name="GStreamer (Arch Linux)" \
      -D package-origin="http://www.archlinux.org/" \
      -D tests=disabled \
      -D examples=disabled \
      -D openexr=disabled .. 
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
