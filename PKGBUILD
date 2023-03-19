# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Kitching <chriskitching@linux.com>

pkgbase=lib32-gst-bad-ugly
pkgname=(
    lib32-gst-libav
    lib32-gst-plugins-ugly
    lib32-gst-plugins-bad-libs
    lib32-gst-plugins-bad
)
pkgver=1.22.1
pkgrel=2
pkgdesc="Multimedia graph framework (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)

makedepends=(
    # superproject
    git meson lib32-gstreamer lib32-gst-plugins-{base,good} wayland-protocols

    # gst-plugins-bad
    lib32-vulkan-icd-loader vulkan-headers lib32-vulkan-validation-layers lib32-shaderc lib32-libusb lib32-libdc1394
    libltc lib32-bluez-libs lib32-libavtp lib32-libbs2b lib32-bzip2 lib32-chromaprint lib32-libdca lib32-faac lib32-faad2
    lib32-libfdk-aac lib32-fluidsynth lib32-libgme lib32-libkate lib32-liblrdf lib32-ladspa lib32-libde265 lib32-lilv lib32-lv2
    lib32-mjpegtools lib32-libmpcdec lib32-neon lib32-openal lib32-libdvdnav lib32-rtmpdump lib32-sbc lib32-soundtouch
    lib32-spandsp lib32-libsrtp lib32-zvbi lib32-libnice lib32-webrtc-audio-processing lib32-wildmidi
    lib32-zbar lib32-nettle lib32-libxml2 lib32-gsm lib32-json-glib lib32-libva lib32-libxkbcommon-x11

    # gst-plugins-ugly
    lib32-a52dec lib32-opencore-amr lib32-libcdio lib32-libdvdread lib32-libmpeg2 lib32-libsidplay lib32-x264

    # gst-libav
    lib32-ffmpeg
)
checkdepends=(xorg-server-xvfb)
options=(!debug)
source=(
  "git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git?signed#tag=$pkgver"
  0001-Allow-disabling-gstreamer.patch
  0002-HACK-meson-Disable-broken-tests.patch
)
sha256sums=('SKIP'
            '0cfce6cad2d9fc55fe36e4ca48ec8aa33106cc1f778ddf0ae47362d230e5539b'
            '9fda6342fb1cbb29dab7ac46e277eee7272b119efee770e72e7d972621fc1e7e')
validpgpkeys=(D637032E45B8C6585B9456565D2EEE6F6F349D7C) # Tim Müller <tim@gstreamer-foundation.org>

pkgver() {
  cd gstreamer
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gstreamer

  # Disable gstreamer
  git apply -3 ../0001-Allow-disabling-gstreamer.patch

  # Disable broken tests
  git apply -3 ../0002-HACK-meson-Disable-broken-tests.patch
}

_fix_pkgconf() {
  if $PKG_CONFIG --variable=libexecdir "$1" | grep -q /usr/libexec; then
	mkdir -p pc
    sed 's@/libexec@/lib32@' "/usr/lib32/pkgconfig/$1.pc" > "$srcdir/pc/$1.pc"
    case ":${PKG_CONFIG_PATH}:" in
      *:"$srcdir/pc":*) return;;
      *) export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}${PKG_CONFIG_PATH+:}${srcdir}/pc";;
    esac
  fi
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'
  _fix_pkgconf gstreamer-1.0
  _fix_pkgconf gstreamer-base-1.0

  local meson_options=(
    --libdir=lib32
    --libexecdir=lib32
    -D devtools=disabled
    -D doc=disabled
    -D examples=disabled
    -D ges=disabled
    -D gpl=enabled
    -D gst-examples=disabled
    -D introspection=disabled
    -D libav=disabled
    -D libnice=disabled
    -D omx=disabled
    -D orc=disabled
    -D python=disabled
    -D qt5=disabled
    -D rs=disabled
    -D rtsp_server=disabled
    -D sharp=disabled
    -D base=disabled # already in repo
    -D good=disabled # already in repo
    -D gstreamer=disabled # already in repo
    # package scoped
    -D libav=enabled
    -D ugly=enabled
    -D bad=enabled
    # subprojects
    -D gst-plugins-bad:directfb=disabled
    -D gst-plugins-bad:flite=disabled
    -D gst-plugins-bad:gobject-cast-checks=disabled
    -D gst-plugins-bad:gs=disabled
    -D gst-plugins-bad:iqa=disabled
    -D gst-plugins-bad:isac=disabled
    -D gst-plugins-bad:magicleap=disabled
    -D gst-plugins-bad:onnx=disabled
    -D gst-plugins-bad:openh264=disabled
    -D gst-plugins-bad:openni2=disabled
    -D gst-plugins-bad:opensles=disabled
    -D gst-plugins-bad:package-name="Arch Linux gst-plugins-bad $pkgver-$pkgrel"
    -D gst-plugins-bad:package-origin="https://www.archlinux.org/"
    -D gst-plugins-bad:tinyalsa=disabled
    -D gst-plugins-bad:voaacenc=disabled
    -D gst-plugins-bad:voamrwbenc=disabled
    -D gst-plugins-bad:wasapi2=disabled
    -D gst-plugins-bad:wasapi=disabled
    -D gst-plugins-bad:opencv=disabled # due to no lib32-opencv
    -D gst-plugins-bad:msdk=disabled # due to no msdk (32-bit) support
    -D gst-plugins-bad:qsv=disabled # due to no x86 support
    -D gst-plugins-bad:ldac=disabled # due to no lib32-libdac support
    -D gst-plugins-bad:microdns=disabled # due to no lib32-microdns support
    -D gst-plugins-bad:openaptx=disabled # due to no lib32-Xaptx support
    -D gst-plugins-bad:openexr=disabled # due to no lib32-openexr support
    -D gst-plugins-bad:openmpt=disabled # due to no lib32-openmpt support
    -D gst-plugins-bad:qroverlay=disabled # due to no lib32-qrencode support
    -D gst-plugins-bad:svthevcenc=disabled # due to no lib32-svthevcenc support
#    -D gst-plugins-bad:svtav1=disabled # due to no lib32-svt-av1
    -D gst-plugins-bad:wpe=disabled # due to no lib32-wpe support
    -D gst-plugins-bad:zxing=disabled # due to no lib32-zxing support
    -D gst-plugins-bad:amfcodec=disabled # only support windows
    -D gst-plugins-bad:directshow=disabled # only support windows

    -D gst-plugins-ugly:gobject-cast-checks=disabled
    -D gst-plugins-ugly:package-name="Arch Linux gst-plugins-ugly $pkgver-$pkgrel"
    -D gst-plugins-ugly:package-origin="https://www.archlinux.org/"

    -D gst-libav:package-name="Arch Linux gst-libav $pkgver-$pkgrel"
    -D gst-libav:package-origin="https://www.archlinux.org/"
  )

  arch-meson gstreamer build "${meson_options[@]}"
  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  # Flaky due to timeouts
  xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs || :
)

_cleanup() {
  rm -rf "$pkgdir"/usr/{include,share}

  if [[ -d "$pkgdir/usr/bin" ]];then
    for _i in "$pkgdir"/usr/bin/*; do
      mv "${_i}" "${_i}-32"
    done
  fi
}

package_lib32-gst-libav() {
  pkgdesc+=" - libav plugin"
  depends=("lib32-gst-plugins-base-libs=$pkgver" lib32-ffmpeg)
  provides=("lib32-gst-ffmpeg=$pkgver")
  replaces=('lib32-gst-libav-latest')

  DESTDIR="$pkgdir" meson install -C build \
    --skip-subprojects gst-plugins-ugly,gst-plugins-bad
  _cleanup
}

package_lib32-gst-plugins-bad() {
  pkgdesc+=" - bad plugins"
  replaces=('lib32-gst-plugins-bad-latest')
  depends=(
    "lib32-gst-plugins-bad-libs=$pkgver" lib32-aom lib32-libass
    lib32-libbs2b lib32-bzip2 lib32-chromaprint lib32-pango lib32-lcms2
    lib32-curl lib32-libxml2 lib32-libdc1394 lib32-libde265 lib32-openssl
    lib32-libdca lib32-faac lib32-faad2 lib32-libfdk-aac lib32-fluidsynth
    lib32-libgme lib32-nettle lib32-libkate lib32-liblrdf lib32-lilv
    lib32-libmodplug lib32-mjpegtools lib32-libmpcdec lib32-neon
    lib32-openal lib32-openjpeg2 lib32-opus lib32-libdvdnav
    lib32-libdvdread lib32-librsvg lib32-rtmpdump lib32-sbc
    lib32-libsndfile libltc lib32-soundtouch lib32-spandsp lib32-srt
    lib32-libsrtp lib32-zvbi lib32-vulkan-icd-loader lib32-libxcb
    lib32-wayland lib32-libwebp lib32-libnice lib32-gsm lib32-libavtp
    lib32-webrtc-audio-processing lib32-wildmidi lib32-x265 lib32-zbar
  )
  mv -v "$pkgdir/../bad/usr" "$pkgdir/usr"
}

package_lib32-gst-plugins-bad-libs() {
  pkgdesc+=" - bad"
  depends=(
    "lib32-gst-plugins-base-libs=$pkgver" lib32-libxkbcommon-x11 lib32-orc
    lib32-libva lib32-libdrm lib32-libx11 lib32-libgudev lib32-libusb
  )
  replaces=('lib32-gst-plugins-bad-libs-latest')

  DESTDIR="$pkgdir" meson install -C build \
    --skip-subprojects gst-plugins-ugly,gst-libav
  _cleanup

  # bad-libs
  local _libs _files
  _libs=(
    #adaptivedemux2 # new
    aes aom assrender
    avtp bs2b bz2 chromaprint
    closedcaption colormanagement
    curl dash dc1394 de265 dtls dtsdec
    faac faad fdkaac fluidsynthmidi
    gme gsm hls kate ladspa lv2 modplug
    mpeg2enc mplex musepack neonhttpsrc
    openal openjpeg opusparse resindvd
    rsvg rtmp sbc sctp smoothstreaming
    sndfile soundtouch spandsp srt
    srtp teletext timecode ttmlsubs
    vulkan waylandsink webp webrtc
    webrtcdsp wildmidi x265 zbar
  )

  mkdir -p "$pkgdir/../bad/usr/lib32/gstreamer-1.0/"
  mapfile -t _files < <(
    printf "$pkgdir"'/usr/lib32/gstreamer-1.0/libgst%s.so\n' "${_libs[@]}"
  )
  mv -t "$pkgdir/../bad/usr/lib32/gstreamer-1.0/" "${_files[@]}"
}

package_lib32-gst-plugins-ugly() {
  pkgdesc+=" - ugly plugins"
  depends=(
    "lib32-gst-plugins-base-libs=$pkgver"
    lib32-libdvdread lib32-libmpeg2 lib32-a52dec lib32-libsidplay lib32-libcdio lib32-x264 lib32-opencore-amr
  )
  replaces=('lib32-gst-plugins-ugly-latest')

  DESTDIR="$pkgdir" meson install -C build \
    --skip-subprojects gst-plugins-bad,gst-libav
  _cleanup
}

# vim: ft=sh:ts=2:et:
