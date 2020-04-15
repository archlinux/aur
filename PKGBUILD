# Maintainer: Andrew Anderson <andrew.wja@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gstreamer-nvidia
pkgname=(gstreamer-nvidia-libs gstreamer-nvidia)
pkgver=1.16.2
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework NVENC and NVDEC plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs orc libdrm libx11 libgudev libusb libvdpau)
makedepends=(git meson neon cuda gobject-introspection)

#~ mjpegtools curl chromaprint libmms faad2 libdca libdvdnav
#~ libmodplug libgme nettle libkate wayland libofa openjpeg2 libwebp
#~ libsrtp sbc rtmpdump libexif libdvdread wildmidi ladspa openal
#~ vulkan-icd-loader libfdk-aac faac soundtouch spandsp neon
#~ webrtc-audio-processing libdc1394 libmpcdec zvbi openexr libbs2b
#~ libnice lcms2 bluez-libs glu srt aom x265 liblrdf libde265 zbar
#~ librsvg fluidsynth lilv lv2 gst-plugins-good python gtk-doc git
#~ vulkan-headers vulkan-validation-layers
#~ wayland-protocols gtk3

checkdepends=()
options=(!emptydirs)
_commit=a6f26408f74a60d02ce6b4f0daee392ce847055f  # tags/1.16.2^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit")
sha256sums=('SKIP')

_plugins_enabled="nvenc nvdec"

pkgver() {
  cd gst-plugins-bad
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gst-plugins-bad
}

build() {
  arch-meson gst-plugins-bad build \
    -D aom=disabled \
    -D assrender=disabled \
    -D bs2b=disabled \
    -D bz2=disabled \
    -D chromaprint=disabled \
    -D closedcaption=disabled \
    -D colormanagement=disabled \
    -D curl=disabled \
    -D dashdemux=disabled \
    -D dc1394=disabled \
    -D de265=disabled \
    -D dtls=disabled \
    -D dtsdec=disabled \
    -D faac=disabled \
    -D faad=disabled \
    -D fdkaac=disabled \
    -D fluidsynthmidi=disabled \
    -D gme=disabled \
    -D hls=disabled \
    -D kate=disabled \
    -D ladspa=disabled \
    -D lv2=disabled \
    -D mms=disabled \
    -D modplug=disabled \
    -D mpeg2enc=disabled \
    -D mplex=disabled \
    -D musepack=disabled \
    -D neonhttpsrc=disabled \
    -D ofa=disabled \
    -D openal=disabled \
    -D openexr=disabled \
    -D openjpeg=disabled \
    -D opusparse=disabled \
    -D resindvd=disabled \
    -D rsvg=disabled \
    -D rtmp=disabled \
    -D sbc=disabled \
    -D smoothstreaming=disabled \
    -D sndfile=disabled \
    -D soundtouch=disabled \
    -D spandsp=disabled \
    -D srt=disabled \
    -D srtp=disabled \
    -D teletext=disabled \
    -D ttmlsubs=disabled \
    -D vulkan=disabled \
    -D waylandsink=disabled \
    -D webp=disabled \
    -D webrtc=disabled \
    -D webrtcdsp=disabled \
    -D wildmidi=disabled \
    -D x265=disabled \
    -D zbar=disabled \
    -D directfb=disabled \
    -D flite=disabled \
    -D gsm=disabled \
    -D iqa=disabled \
    -D msdk=disabled \
    -D nvdec=enabled \
    -D nvenc=enabled \
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
    -D glib-asserts=disabled \
    -D glib-checks=disabled \
    -D package-name="GStreamer NVENC and NVDEC Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  ninja -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs
)

package_gstreamer-nvidia-libs() {
  pkgdesc="${pkgdesc/plugins/libraries}"

  DESTDIR="$pkgdir" meson install -C build

  mkdir -p ext/lib/gstreamer-1.0
  for _x in ${_plugins_enabled}; do
    _x="lib/gstreamer-1.0/libgst${_x}.so"
    mv "$pkgdir/usr/$_x" "ext/$_x"
  done
}

package_gstreamer-nvidia() {
  depends=("gstreamer-nvidia-libs=$pkgver" cuda neon)

#~ gst-plugins-good
#~ aom libass libbs2b bzip2 chromaprint pango lcms2 curl libxml2
#~ libdc1394 libde265 openssl libdca faac faad2 libfdk-aac fluidsynth
#~ libgme nettle libkate liblrdf lilv libmms libmodplug mjpegtools
#~ libmpcdec neon libofa openal openexr openjpeg2 opus libdvdnav
#~ libdvdread librsvg rtmpdump sbc libsndfile soundtouch spandsp srt
#~ libsrtp zvbi vulkan-icd-loader libxcb wayland libwebp libnice
#~ webrtc-audio-processing wildmidi x265 zbar

  mv ext "$pkgdir/usr"
}
