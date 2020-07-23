# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gst-plugins-bad-nvidia
pkgname=(gst-plugins-bad-nvidia-libs gst-plugins-bad-nvidia)
pkgver=1.16.2
pkgrel=7
pkgdesc="GStreamer open-source multimedia framework bad plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs orc libdrm libx11 libgudev libusb libvdpau nvidia)
makedepends=(mjpegtools curl chromaprint libmms faad2 libdca libdvdnav
             libmodplug libgme nettle libkate wayland libofa openjpeg2 libwebp
             libsrtp sbc rtmpdump libexif libdvdread wildmidi ladspa openal
             vulkan-icd-loader libfdk-aac faac soundtouch spandsp neon
             webrtc-audio-processing libdc1394 libmpcdec zvbi openexr libbs2b
             libnice lcms2 bluez-libs glu srt aom x265 liblrdf libde265 zbar
             librsvg fluidsynth lilv lv2 gst-plugins-good python gtk-doc git
             gobject-introspection vulkan-headers vulkan-validation-layers
             wayland-protocols gtk3 meson 'cuda-10.1')
checkdepends=(xorg-server-xvfb)
options=(!emptydirs)
_commit=a6f26408f74a60d02ce6b4f0daee392ce847055f  # tags/1.16.2^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit"
        0001-vulkan-Drop-use-of-VK_RESULT_BEGIN_RANGE.patch)
sha256sums=('SKIP'
            '0c6c51a371d8f381a2190280913cc41e06c17c25dbb1167043072003b3f0d338')

pkgver() {
  cd gst-plugins-bad
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gst-plugins-bad

  # Fix build with neon 0.31
  git cherry-pick -n f10b424418e448211e3427a76fcd046e157ef0b7

  # Fix build with vulkan-headers 1.2.140
  git apply -3 ../0001-vulkan-Drop-use-of-VK_RESULT_BEGIN_RANGE.patch

  # Fix build with GCC 10
  git cherry-pick -n a0cd455dd0e0375c6395fe732173225ea7e18562
}

build() {
  arch-meson gst-plugins-bad build \
    -D directfb=disabled \
    -D flite=disabled \
    -D gsm=disabled \
    -D iqa=disabled \
    -D msdk=disabled \
    -D opencv=disabled \
    -D openh264=disabled \
    -D openmpt=disabled \
    -D openni2=disabled \
    -D opensles=disabled \
    -D sctp=disabled \
    -D tinyalsa=disabled \
    -D voaacenc=disabled \
    -D voamrwbenc=disabled \
    -D wasapi=disabled \
    -D wpe=disabled \
    -D gobject-cast-checks=disabled \
    -D package-name="GStreamer Bad Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs
)

package_gst-plugins-bad-nvidia-libs() {
  provides=('gst-plugins-bad-libs')
  pkgdesc="${pkgdesc/plugins/libraries}"

  DESTDIR="$pkgdir" meson install -C build

  mkdir -p ext/lib/gstreamer-1.0
  for _x in aom assrender bs2b bz2 chromaprint closedcaption colormanagement \
            curl dashdemux dc1394 de265 dtls dtsdec faac faad fdkaac \
            fluidsynthmidi gme hls kate ladspa lv2 mms modplug mpeg2enc mplex \
            musepack neonhttpsrc ofa openal openexr openjpeg opusparse \
            resindvd rsvg rtmp sbc smoothstreaming sndfile soundtouch spandsp \
            srt srtp teletext ttmlsubs vulkan waylandsink webp webrtc \
            webrtcdsp wildmidi x265 zbar; do
    _x="lib/gstreamer-1.0/libgst${_x}.so"
    mv "$pkgdir/usr/$_x" "ext/$_x"
  done
}

package_gst-plugins-bad-nvidia() {
  provides=('gst-plugins-bad')
  depends=("gst-plugins-bad-nvidia-libs=$pkgver" gst-plugins-good
           aom libass libbs2b bzip2 chromaprint pango lcms2 curl libxml2
           libdc1394 libde265 openssl libdca faac faad2 libfdk-aac fluidsynth
           libgme nettle libkate liblrdf lilv libmms libmodplug mjpegtools
           libmpcdec neon libofa openal openexr openjpeg2 opus libdvdnav
           libdvdread librsvg rtmpdump sbc libsndfile soundtouch spandsp srt
           libsrtp zvbi vulkan-icd-loader libxcb wayland libwebp libnice
           webrtc-audio-processing wildmidi x265 zbar)

  mv ext "$pkgdir/usr"
}

