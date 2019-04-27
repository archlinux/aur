# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-good
pkgver=1.16.0
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base' 'mingw-w64-orc' 'mingw-w64-bzip2')
makedepends=('mingw-w64-meson' 'mingw-w64-libsoup' 'mingw-w64-cairo' 'mingw-w64-gdk-pixbuf2' 'mingw-w64-libvpx' 'mingw-w64-speex' 'mingw-w64-flac' 'mingw-w64-wavpack' 'mingw-w64-mpg123' 'mingw-w64-lame')
optdepends=(
  "mingw-w64-libsoup: libsoup HTTP client source/sink plugin"
  "mingw-w64-cairo: Cairo overlay plugin"
  "mingw-w64-gdk-pixbuf2: gdk-pixbuf image decoder, overlay, and sink plugin"
  "mingw-w64-libpng: PNG image codec plugin"
  "mingw-w64-libjpeg-turbo: JPEG image codec plugin"
  "mingw-w64-libvpx: VP8 and VP9 video codec plugin"
  "mingw-w64-speex: Speex audio codec plugin"
  "mingw-w64-flac: FLAC audio codec plugin"
  "mingw-w64-wavpack: Wavpack audio codec plugin"
  "mingw-w64-mpg123: mpg123 mp3 audio decoder plugin"
  "mingw-w64-lame: LAME mp3 audio encoder plugin"
)

options=('!strip' '!buildflags' 'staticlibs')

source=(${url}src/gst-plugins-good/gst-plugins-good-${pkgver}.tar.xz)
sha256sums=('654adef33380d604112f702c2927574cfc285e31307b79e584113858838bb0fd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "${srcdir}/gst-plugins-good-${pkgver}"

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
  cd "${srcdir}/gst-plugins-good-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/gst-plugins-good-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
