# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-plugins-bad
pkgver=1.14.4
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base' 'mingw-w64-orc')
makedepends=('python' 'mingw-w64-configure' 'mingw-w64-openh264' 'mingw-w64-nettle' 'mingw-w64-opus' 'mingw-w64-bzip2' 'mingw-w64-libsrtp' 'mingw-w64-vo-aacenc' 'mingw-w64-libkate' 'mingw-w64-librsvg' 'mingw-w64-openjpeg2' 'mingw-w64-opencv' 'mingw-w64-libfdk-aac' 'mingw-w64-librtmp0' 'mingw-w64-libwebp' 'mingw-w64-srt' 'mingw-w64-curl')
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

source=(${url}/src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz)
sha256sums=('910b4e0e2e897e8b6d06767af1779d70057c309f67292f485ff988d087aa0de5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples --disable-videomaxrate --disable-festival \
      --disable-celt -disable-directfb --disable-dirac --disable-flite \
      --disable-gme --disable-ladspa --disable-lv2 --disable-mimic \
      --disable-modplug --disable-mpeg2enc --disable-mplex \
      --disable-musepack --disable-mythtv --disable-neon --disable-ofa \
      --disable-openal --disable-pvr --disable-sdl --disable-sndfile \
      --disable-teletextdec --disable-timidity --disable-vdpau \
      --disable-voamrwbenc --disable-wildmidi --disable-xvid \
      --disable-zbar --disable-sdi --disable-qt

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
    cd ..
  done
}


package() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"

  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.a
    rm "$pkgdir"/usr/$_arch/lib/gstreamer-1.0/*.la
    rm -rf "$pkgdir"/usr/${_arch}/share/${aclocal,man,locale}

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;

    cd ..
  done
}

# vim: ts=2 sw=2 et:
