# Maintainer: ZJX <fish_spitting_ooo@163.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-gstreamer-git
pkgname=(
  lib32-gstreamer-git
  
  lib32-gst-plugins-bad-libs-git   # Split badaudio first
  lib32-gst-plugins-base-libs-git
  lib32-gst-plugins-base-git
  lib32-gst-plugins-good-git
  lib32-gst-plugins-bad-git

  lib32-gst-plugin-{gtk,va}-git
  lib32-gst-plugins-ugly-git

  lib32-gst-{libav,rtsp-server}-git

  lib32-gstreamer-vaapi-git
)
pkgver=1.22.0+r419+gaeb262a7e1
pkgrel=1
pkgdesc="Multimedia graph framework (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
group=(lib32-gstreamer)
makedepends=(
  # superproject
  git meson

  # gstreamer
  valgrind lib32-libunwind bash-completion lib32-gtk3 lib32-libcap 

  # gst-plugins-base
  lib32-cdparanoia lib32-libvisual lib32-opus lib32-libtheora lib32-libxv lib32-sdl2
  lib32-zlib lib32-libgl lib32-wayland wayland-protocols lib32-libx11 lib32-libgudev lib32-libdrm lib32-mesa lib32-orc

  # gst-plugins-good
  nasm lib32-v4l-utils lib32-aalib lib32-flac lib32-jack lib32-lame lib32-libcaca lib32-libdv lib32-mpg123 lib32-libraw1394
  lib32-libavc1394 lib32-libiec61883 lib32-libpulse lib32-libshout lib32-taglib lib32-twolame lib32-libvpx lib32-wavpack 
  lib32-cairo lib32-libsoup3

  # gst-plugins-bad
  lib32-vulkan-icd-loader vulkan-headers lib32-vulkan-validation-layers lib32-shaderc lib32-libusb lib32-libdc1394
  libltc lib32-bluez-libs lib32-libavtp lib32-libbs2b lib32-bzip2 lib32-chromaprint lib32-libdca lib32-faac lib32-faad2
  lib32-libfdk-aac lib32-fluidsynth lib32-libgme lib32-libkate lib32-liblrdf lib32-ladspa lib32-libde265 lib32-lilv lib32-lv2
  lib32-mjpegtools lib32-libmpcdec lib32-neon lib32-openal lib32-libdvdnav lib32-rtmpdump lib32-sbc lib32-soundtouch
  lib32-spandsp lib32-libsrtp lib32-zvbi 'lib32-libnice>=0.1.20' lib32-webrtc-audio-processing lib32-wildmidi
  lib32-zbar lib32-nettle lib32-libxml2 lib32-gsm lib32-json-glib lib32-libva lib32-libxkbcommon-x11

  # gst-plugins-ugly
  lib32-a52dec lib32-opencore-amr lib32-libcdio lib32-libdvdread lib32-libmpeg2 lib32-libsidplay lib32-x264

  # gst-libav
  lib32-ffmpeg

  # gstreamer-vaapi
  lib32-libxrandr
)
checkdepends=(xorg-server-xvfb)
options=(debug)
source=(
  "git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git"
)
sha256sums=('SKIP')

pkgver() {
  cd gstreamer
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gstreamer
}

build() {
  local meson_options=(
    -D devtools=disabled
    -D doc=disabled
    -D examples=disabled
    -D ges=disabled
    -D gpl=enabled
    -D gst-examples=disabled
    -D libnice=disabled
    -D omx=disabled # fix
    -D orc=enabled # fix
    -D orc-source="system" # fix
    -D vaapi=enabled
    -D python=disabled # fix
    -D sharp=disabled # fix
    -D rs=disabled # fix
    -D tls=disabled # fix
    -D introspection=disabled # due to no lib32-gobject-introspection
    -D qt5=disabled # fix
    -D qt6=disabled # fix
    -D gstreamer:dbghelp=disabled
    -D gstreamer:gobject-cast-checks=disabled
    -D gstreamer:package-name="Arch Linux gstreamer $pkgver-$pkgrel"
    -D gstreamer:package-origin="https://www.archlinux.org/"
    -D gstreamer:ptp-helper-permissions=capabilities
    -D gst-plugins-base:gobject-cast-checks=disabled
    -D gst-plugins-base:package-name="Arch Linux gst-plugins-base $pkgver-$pkgrel"
    -D gst-plugins-base:package-origin="https://www.archlinux.org/"
    -D gst-plugins-base:tremor=disabled
    -D gst-plugins-base:iso-codes=disabled # due to no lib32-iso-codes
    -D gst-plugins-base:gl-graphene=disabled # due to no lib32-graphene
    -D gst-plugins-good:gobject-cast-checks=disabled
    -D gst-plugins-good:package-name="Arch Linux gst-plugins-good $pkgver-$pkgrel"
    -D gst-plugins-good:package-origin="https://www.archlinux.org/"
    -D gst-plugins-good:rpicamsrc=disabled
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
    -D gst-plugins-bad:svtav1=disabled # due to no lib32-svt-av1
    -D gst-plugins-bad:wpe=disabled # due to no lib32-wpe support
    -D gst-plugins-bad:zxing=disabled # due to no lib32-zxing support
    -D gst-plugins-bad:amfcodec=disabled # only support windows
    -D gst-plugins-bad:directshow=disabled # only support windows
    -D gst-plugins-ugly:gobject-cast-checks=disabled
    -D gst-plugins-ugly:package-name="Arch Linux gst-plugins-ugly $pkgver-$pkgrel"
    -D gst-plugins-ugly:package-origin="https://www.archlinux.org/"
    -D gst-libav:package-name="Arch Linux gst-libav $pkgver-$pkgrel"
    -D gst-libav:package-origin="https://www.archlinux.org/"
    -D gst-rtsp-server:gobject-cast-checks=disabled
    -D gst-rtsp-server:package-name="Arch Linux gst-rtsp-server $pkgver-$pkgrel"
    -D gst-rtsp-server:package-origin="https://www.archlinux.org/"
    -D gstreamer-vaapi:package-origin="https://www.archlinux.org/"
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

  arch-meson gstreamer build \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    "${meson_options[@]}"

  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  # Flaky due to timeouts
  xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs || :
)

_install() {
  local src dir
  local pattern='*/usr/bin'
  for src in "${files[@]}"; do
    dir="$pkgdir/$(dirname "$src")"
    mkdir -p "$dir"

    if [[ $dir = $pattern ]]; then
      mv "${src}" "${src}-32"
      src="${src}-32"
    fi

    mv -v "$src" "$dir"
  done
}

_remove() {
  local src dir
  for src in "${files[@]}"; do
    rm -r $src
  done
}

package_lib32-gstreamer-git() {
  pkgdesc+=" - core"
  depends=(lib32-libxml2 lib32-glib2 lib32-libunwind lib32-libelf gstreamer)
  provides=("lib32-gstreamer=$pkgver")
  conflicts=("lib32-gstreamer")
  install=gstreamer.install

  DESTDIR="$srcdir/root" meson install -C build

  cd root
  local files=(
    usr/include/gstreamer-1.0/gst/{base,check,controller,net,*.h}

    usr/share/locale/*/LC_MESSAGES/gstreamer-1.0.mo
    usr/share/man/man1/gst-{inspect,launch,stats,typefind}-1.0.1
    usr/share/bash-completion
    usr/share/gdb/auto-load/usr/lib32/libgstreamer-1.0.so*.py
    usr/share/gstreamer-1.0/gdb
    usr/share/aclocal/gst-element-check-1.0.m4
  ); _remove

  local files=(
    usr/lib32/libgst{reamer,base,check,controller,net}-1.0.so*
    usr/lib32/pkgconfig/gstreamer{,-base,-check,-controller,-net}-1.0.pc
    usr/lib32/gstreamer-1.0/gst-{completion,ptp}-helper
    usr/lib32/gstreamer-1.0/gst-{hotdoc-plugins,plugin}-scanner
    usr/lib32/gstreamer-1.0/gst-plugins-doc-cache-generator
    usr/lib32/gstreamer-1.0/libgstcoreelements.so
    usr/lib32/gstreamer-1.0/libgstcoretracers.so
    usr/bin/gst-{inspect,launch,stats,tester,typefind}-1.0
  ); _install
}

package_lib32-gst-plugins-bad-libs-git() {
  pkgdesc+=" - bad"
  depends=(
    "lib32-gst-plugins-base-libs-git=$pkgver"
    lib32-orc lib32-libdrm lib32-libx11 lib32-libgudev lib32-libusb lib32-libxkbcommon-x11
  )
  provides=("lib32-gst-plugins-bad-libs=$pkgver")
  conflicts=("lib32-gst-plugins-bad-libs")

  cd root; local files=(
    usr/lib32/libgst{adaptivedemux,badaudio,basecamerabinsrc,codecparsers,codecs,cuda,insertbin,isoff,mpegts,photography,play,player,sctp,transcoder,uridownloader,vulkan,wayland,webrtc,webrtcnice}-1.0.so*
    usr/lib32/pkgconfig/gstreamer-{bad-audio,codecparsers,cuda,insertbin,mpegts,photography,play,player,plugins-bad,sctp,transcoder,va,vulkan{,-wayland,-xcb},wayland,webrtc{,-nice}}-1.0.pc

    usr/lib32/gstreamer-1.0/libgstaccurip.so
    usr/lib32/gstreamer-1.0/libgstadpcmdec.so
    usr/lib32/gstreamer-1.0/libgstadpcmenc.so
    usr/lib32/gstreamer-1.0/libgstaiff.so
    usr/lib32/gstreamer-1.0/libgstasfmux.so
    usr/lib32/gstreamer-1.0/libgstaudiobuffersplit.so
    usr/lib32/gstreamer-1.0/libgstaudiofxbad.so
    usr/lib32/gstreamer-1.0/libgstaudiolatency.so
    usr/lib32/gstreamer-1.0/libgstaudiomixmatrix.so
    usr/lib32/gstreamer-1.0/libgstaudiovisualizers.so
    usr/lib32/gstreamer-1.0/libgstautoconvert.so
    usr/lib32/gstreamer-1.0/libgstbayer.so
    usr/lib32/gstreamer-1.0/libgstbluez.so
    usr/lib32/gstreamer-1.0/libgstcamerabin.so
    usr/lib32/gstreamer-1.0/libgstcodecalpha.so
    usr/lib32/gstreamer-1.0/libgstcodectimestamper.so
    usr/lib32/gstreamer-1.0/libgstcoloreffects.so
    usr/lib32/gstreamer-1.0/libgstdebugutilsbad.so
    usr/lib32/gstreamer-1.0/libgstdecklink.so
    usr/lib32/gstreamer-1.0/libgstdvb.so
    usr/lib32/gstreamer-1.0/libgstdvbsubenc.so
    usr/lib32/gstreamer-1.0/libgstdvbsuboverlay.so
    usr/lib32/gstreamer-1.0/libgstdvdspu.so
    usr/lib32/gstreamer-1.0/libgstfaceoverlay.so
    usr/lib32/gstreamer-1.0/libgstfbdevsink.so
    usr/lib32/gstreamer-1.0/libgstfestival.so
    usr/lib32/gstreamer-1.0/libgstfieldanalysis.so
    usr/lib32/gstreamer-1.0/libgstfreeverb.so
    usr/lib32/gstreamer-1.0/libgstfrei0r.so
    usr/lib32/gstreamer-1.0/libgstgaudieffects.so
    usr/lib32/gstreamer-1.0/libgstgdp.so
    usr/lib32/gstreamer-1.0/libgstgeometrictransform.so
    usr/lib32/gstreamer-1.0/libgstgtkwayland.so
    usr/lib32/gstreamer-1.0/libgstid3tag.so
    usr/lib32/gstreamer-1.0/libgstinter.so
    usr/lib32/gstreamer-1.0/libgstinterlace.so
    usr/lib32/gstreamer-1.0/libgstipcpipeline.so
    usr/lib32/gstreamer-1.0/libgstivfparse.so
    usr/lib32/gstreamer-1.0/libgstivtc.so
    usr/lib32/gstreamer-1.0/libgstjp2kdecimator.so
    usr/lib32/gstreamer-1.0/libgstjpegformat.so
    usr/lib32/gstreamer-1.0/libgstkms.so
    usr/lib32/gstreamer-1.0/libgstlegacyrawparse.so
    usr/lib32/gstreamer-1.0/libgstmidi.so
    usr/lib32/gstreamer-1.0/libgstmpegpsdemux.so
    usr/lib32/gstreamer-1.0/libgstmpegpsmux.so
    usr/lib32/gstreamer-1.0/libgstmpegtsdemux.so
    usr/lib32/gstreamer-1.0/libgstmpegtsmux.so
    usr/lib32/gstreamer-1.0/libgstmxf.so
    usr/lib32/gstreamer-1.0/libgstnetsim.so
    usr/lib32/gstreamer-1.0/libgstnvcodec.so
    usr/lib32/gstreamer-1.0/libgstpcapparse.so
    usr/lib32/gstreamer-1.0/libgstpnm.so
    usr/lib32/gstreamer-1.0/libgstproxy.so
    usr/lib32/gstreamer-1.0/libgstremovesilence.so
    usr/lib32/gstreamer-1.0/libgstrfbsrc.so
    usr/lib32/gstreamer-1.0/libgstrist.so
    usr/lib32/gstreamer-1.0/libgstrtmp2.so
    usr/lib32/gstreamer-1.0/libgstrtpmanagerbad.so
    usr/lib32/gstreamer-1.0/libgstrtponvif.so
    usr/lib32/gstreamer-1.0/libgstsdpelem.so
    usr/lib32/gstreamer-1.0/libgstsegmentclip.so
    usr/lib32/gstreamer-1.0/libgstshm.so
    usr/lib32/gstreamer-1.0/libgstsiren.so
    usr/lib32/gstreamer-1.0/libgstsmooth.so
    usr/lib32/gstreamer-1.0/libgstspeed.so
    usr/lib32/gstreamer-1.0/libgstsubenc.so
    usr/lib32/gstreamer-1.0/libgstswitchbin.so
    usr/lib32/gstreamer-1.0/libgsttranscode.so
    usr/lib32/gstreamer-1.0/libgstuvch264.so
    usr/lib32/gstreamer-1.0/libgstv4l2codecs.so
    usr/lib32/gstreamer-1.0/libgstvideofiltersbad.so
    usr/lib32/gstreamer-1.0/libgstvideoframe_audiolevel.so
    usr/lib32/gstreamer-1.0/libgstvideoparsersbad.so
    usr/lib32/gstreamer-1.0/libgstvideosignal.so
    usr/lib32/gstreamer-1.0/libgstvmnc.so
    usr/lib32/gstreamer-1.0/libgsty4mdec.so

    usr/bin/gst-transcoder-1.0
  ); _install
}

package_lib32-gst-plugins-base-libs-git() {
  pkgdesc+=" - base"
  depends=(
    "lib32-gstreamer-git=$pkgver"
    lib32-orc lib32-libxv lib32-libgudev lib32-libgl lib32-mesa
  )
  provides=("lib32-gst-plugins-base-libs=$pkgver")
  conflicts=("lib32-gst-plugins-base-libs")

  cd root; local files=(
    usr/lib32/libgst{allocators,app,audio,fft,gl,pbutils,riff,rtp,rtsp,sdp,tag,video}-1.0.so*
    usr/lib32/pkgconfig/gstreamer-{allocators,app,audio,fft,gl{,-egl,-prototypes,-wayland,-x11},pbutils,riff,rtp,rtsp,sdp,tag,video}-1.0.pc

    usr/lib32/pkgconfig/gstreamer-plugins-base-1.0.pc
    usr/lib32/gstreamer-1.0/include/gst/gl/gstglconfig.h
    usr/lib32/gstreamer-1.0/libgstadder.so
    usr/lib32/gstreamer-1.0/libgstapp.so
    usr/lib32/gstreamer-1.0/libgstaudioconvert.so
    usr/lib32/gstreamer-1.0/libgstaudiomixer.so
    usr/lib32/gstreamer-1.0/libgstaudiorate.so
    usr/lib32/gstreamer-1.0/libgstaudioresample.so
    usr/lib32/gstreamer-1.0/libgstaudiotestsrc.so
    usr/lib32/gstreamer-1.0/libgstcompositor.so
    usr/lib32/gstreamer-1.0/libgstencoding.so
    usr/lib32/gstreamer-1.0/libgstgio.so
    usr/lib32/gstreamer-1.0/libgstoverlaycomposition.so
    usr/lib32/gstreamer-1.0/libgstpbtypes.so
    usr/lib32/gstreamer-1.0/libgstplayback.so
    usr/lib32/gstreamer-1.0/libgstrawparse.so
    usr/lib32/gstreamer-1.0/libgstsubparse.so
    usr/lib32/gstreamer-1.0/libgsttcp.so
    usr/lib32/gstreamer-1.0/libgsttypefindfunctions.so
    usr/lib32/gstreamer-1.0/libgstvideoconvertscale.so
    usr/lib32/gstreamer-1.0/libgstvideorate.so
    usr/lib32/gstreamer-1.0/libgstvideotestsrc.so
    usr/lib32/gstreamer-1.0/libgstvolume.so
    usr/lib32/gstreamer-1.0/libgstximagesink.so
    usr/lib32/gstreamer-1.0/libgstxvimagesink.so

    usr/bin/gst-{device-monitor,discoverer,play}-1.0
  ); _install
}

package_lib32-gst-plugins-base-git() {
  pkgdesc+=" - base plugins"
  depends=(
    "lib32-gst-plugins-base-libs-git=$pkgver"
    lib32-alsa-lib lib32-cdparanoia lib32-libvisual lib32-libvorbis lib32-libtheora lib32-pango lib32-opus lib32-libpng lib32-libjpeg
  )
  provides=("lib32-gst-plugins-base=$pkgver")
  conflicts=("lib32-gst-plugins-base")

  cd root; local files=(
    usr/lib32/gstreamer-1.0/libgstalsa.so
    usr/lib32/gstreamer-1.0/libgstcdparanoia.so
    usr/lib32/gstreamer-1.0/libgstlibvisual.so
    usr/lib32/gstreamer-1.0/libgstogg.so
    usr/lib32/gstreamer-1.0/libgstopengl.so
    usr/lib32/gstreamer-1.0/libgstopus.so
    usr/lib32/gstreamer-1.0/libgstpango.so
    usr/lib32/gstreamer-1.0/libgsttheora.so
    usr/lib32/gstreamer-1.0/libgstvorbis.so
  ); _install
}

package_lib32-gst-plugins-good-git() {
  pkgdesc+=" - good plugins"
  depends=(
    "lib32-gst-plugins-base-libs-git=$pkgver"
    lib32-libpulse lib32-libsoup3 lib32-gst-plugins-base-libs lib32-wavpack lib32-aalib lib32-taglib lib32-libdv lib32-libshout
    lib32-libvpx lib32-gdk-pixbuf2 lib32-libcaca lib32-libavc1394 lib32-libiec61883 lib32-libxdamage lib32-v4l-utils lib32-cairo
    lib32-libgudev lib32-speex lib32-flac lib32-libraw1394 lib32-lame lib32-mpg123 lib32-twolame libjack.so
  )
  provides=("lib32-gst-plugins-good=$pkgver")
  conflicts=("lib32-gst-plugins-good")

  cd root; local files=(
    usr/lib32/gstreamer-1.0/libgst1394.so
    usr/lib32/gstreamer-1.0/libgstaasink.so
    usr/lib32/gstreamer-1.0/libgstalaw.so
    usr/lib32/gstreamer-1.0/libgstalpha.so
    usr/lib32/gstreamer-1.0/libgstalphacolor.so
    usr/lib32/gstreamer-1.0/libgstapetag.so
    usr/lib32/gstreamer-1.0/libgstaudiofx.so
    usr/lib32/gstreamer-1.0/libgstaudioparsers.so
    usr/lib32/gstreamer-1.0/libgstauparse.so
    usr/lib32/gstreamer-1.0/libgstautodetect.so
    usr/lib32/gstreamer-1.0/libgstavi.so
    usr/lib32/gstreamer-1.0/libgstcacasink.so
    usr/lib32/gstreamer-1.0/libgstcairo.so
    usr/lib32/gstreamer-1.0/libgstcutter.so
    usr/lib32/gstreamer-1.0/libgstdebug.so
    usr/lib32/gstreamer-1.0/libgstdeinterlace.so
    usr/lib32/gstreamer-1.0/libgstdtmf.so
    usr/lib32/gstreamer-1.0/libgstdv.so
    usr/lib32/gstreamer-1.0/libgsteffectv.so
    usr/lib32/gstreamer-1.0/libgstequalizer.so
    usr/lib32/gstreamer-1.0/libgstflac.so
    usr/lib32/gstreamer-1.0/libgstflv.so
    usr/lib32/gstreamer-1.0/libgstflxdec.so
    usr/lib32/gstreamer-1.0/libgstgdkpixbuf.so
    usr/lib32/gstreamer-1.0/libgstgoom.so
    usr/lib32/gstreamer-1.0/libgstgoom2k1.so
    usr/lib32/gstreamer-1.0/libgsticydemux.so
    usr/lib32/gstreamer-1.0/libgstid3demux.so
    usr/lib32/gstreamer-1.0/libgstimagefreeze.so
    usr/lib32/gstreamer-1.0/libgstinterleave.so
    usr/lib32/gstreamer-1.0/libgstisomp4.so
    usr/lib32/gstreamer-1.0/libgstjack.so
    usr/lib32/gstreamer-1.0/libgstjpeg.so
    usr/lib32/gstreamer-1.0/libgstlame.so
    usr/lib32/gstreamer-1.0/libgstlevel.so
    usr/lib32/gstreamer-1.0/libgstmatroska.so
    usr/lib32/gstreamer-1.0/libgstmonoscope.so
    usr/lib32/gstreamer-1.0/libgstmpg123.so
    usr/lib32/gstreamer-1.0/libgstmulaw.so
    usr/lib32/gstreamer-1.0/libgstmultifile.so
    usr/lib32/gstreamer-1.0/libgstmultipart.so
    usr/lib32/gstreamer-1.0/libgstnavigationtest.so
    usr/lib32/gstreamer-1.0/libgstoss4.so
    usr/lib32/gstreamer-1.0/libgstossaudio.so
    usr/lib32/gstreamer-1.0/libgstpng.so
    usr/lib32/gstreamer-1.0/libgstpulseaudio.so
    usr/lib32/gstreamer-1.0/libgstreplaygain.so
    usr/lib32/gstreamer-1.0/libgstrtp.so
    usr/lib32/gstreamer-1.0/libgstrtpmanager.so
    usr/lib32/gstreamer-1.0/libgstrtsp.so
    usr/lib32/gstreamer-1.0/libgstshapewipe.so
    usr/lib32/gstreamer-1.0/libgstshout2.so
    usr/lib32/gstreamer-1.0/libgstsmpte.so
    usr/lib32/gstreamer-1.0/libgstsoup.so
    usr/lib32/gstreamer-1.0/libgstspectrum.so
    usr/lib32/gstreamer-1.0/libgstspeex.so
    usr/lib32/gstreamer-1.0/libgsttaglib.so
    usr/lib32/gstreamer-1.0/libgsttwolame.so
    usr/lib32/gstreamer-1.0/libgstudp.so
    usr/lib32/gstreamer-1.0/libgstvideo4linux2.so
    usr/lib32/gstreamer-1.0/libgstvideobox.so
    usr/lib32/gstreamer-1.0/libgstvideocrop.so
    usr/lib32/gstreamer-1.0/libgstvideofilter.so
    usr/lib32/gstreamer-1.0/libgstvideomixer.so
    usr/lib32/gstreamer-1.0/libgstvpx.so
    usr/lib32/gstreamer-1.0/libgstwavenc.so
    usr/lib32/gstreamer-1.0/libgstwavpack.so
    usr/lib32/gstreamer-1.0/libgstwavparse.so
    usr/lib32/gstreamer-1.0/libgstximagesrc.so
    usr/lib32/gstreamer-1.0/libgsty4menc.so
  ); _install
}

package_lib32-gst-plugins-bad-git() {
  pkgdesc+=" - bad plugins"
  depends=(
    "lib32-gst-plugins-bad-libs-git=$pkgver"
    lib32-aom lib32-libass lib32-libbs2b lib32-bzip2 lib32-chromaprint lib32-pango lib32-lcms2 lib32-curl lib32-libxml2 lib32-libdc1394
    lib32-libde265 lib32-openssl lib32-libdca lib32-faac lib32-faad2 lib32-libfdk-aac lib32-fluidsynth lib32-libgme lib32-nettle
    lib32-libkate lib32-liblrdf lib32-lilv lib32-libmodplug lib32-mjpegtools lib32-libmpcdec lib32-neon lib32-openal 
    lib32-openjpeg2 lib32-opus lib32-libdvdnav lib32-libdvdread lib32-librsvg lib32-rtmpdump lib32-sbc lib32-libsndfile libltc
    lib32-soundtouch lib32-spandsp lib32-srt lib32-libsrtp lib32-zvbi lib32-vulkan-icd-loader lib32-libxcb lib32-wayland lib32-libwebp
    lib32-libnice lib32-webrtc-audio-processing lib32-wildmidi lib32-x265 lib32-zbar lib32-gsm lib32-json-glib lib32-libavtp 
  )
  optdepends=('lib32-nvidia-utils: nvcodec plugin')
  provides=("lib32-gst-plugins-bad=$pkgver")
  conflicts=("lib32-gst-plugins-bad")

  cd root; local files=(
    usr/lib32/gstreamer-1.0/libgstadaptivedemux2.so # new
    usr/lib32/gstreamer-1.0/libgstaes.so
    usr/lib32/gstreamer-1.0/libgstaom.so
    usr/lib32/gstreamer-1.0/libgstassrender.so
    usr/lib32/gstreamer-1.0/libgstavtp.so
    usr/lib32/gstreamer-1.0/libgstbs2b.so
    usr/lib32/gstreamer-1.0/libgstbz2.so
    usr/lib32/gstreamer-1.0/libgstchromaprint.so
    usr/lib32/gstreamer-1.0/libgstclosedcaption.so
    usr/lib32/gstreamer-1.0/libgstcolormanagement.so
    usr/lib32/gstreamer-1.0/libgstcurl.so
    usr/lib32/gstreamer-1.0/libgstdash.so
    usr/lib32/gstreamer-1.0/libgstdc1394.so
    usr/lib32/gstreamer-1.0/libgstde265.so
    usr/lib32/gstreamer-1.0/libgstdtls.so
    usr/lib32/gstreamer-1.0/libgstdtsdec.so
    usr/lib32/gstreamer-1.0/libgstfaac.so
    usr/lib32/gstreamer-1.0/libgstfaad.so
    usr/lib32/gstreamer-1.0/libgstfdkaac.so
    usr/lib32/gstreamer-1.0/libgstfluidsynthmidi.so
    usr/lib32/gstreamer-1.0/libgstgme.so
    usr/lib32/gstreamer-1.0/libgstgsm.so
    usr/lib32/gstreamer-1.0/libgsthls.so
    usr/lib32/gstreamer-1.0/libgstkate.so
    usr/lib32/gstreamer-1.0/libgstladspa.so
    usr/lib32/gstreamer-1.0/libgstlv2.so
    usr/lib32/gstreamer-1.0/libgstmodplug.so
    usr/lib32/gstreamer-1.0/libgstmpeg2enc.so
    usr/lib32/gstreamer-1.0/libgstmplex.so
    usr/lib32/gstreamer-1.0/libgstmusepack.so
    usr/lib32/gstreamer-1.0/libgstneonhttpsrc.so
    usr/lib32/gstreamer-1.0/libgstopenal.so
    usr/lib32/gstreamer-1.0/libgstopenjpeg.so
    usr/lib32/gstreamer-1.0/libgstopusparse.so
    usr/lib32/gstreamer-1.0/libgstresindvd.so
    usr/lib32/gstreamer-1.0/libgstrsvg.so
    usr/lib32/gstreamer-1.0/libgstrtmp.so
    usr/lib32/gstreamer-1.0/libgstsbc.so
    usr/lib32/gstreamer-1.0/libgstsctp.so
    usr/lib32/gstreamer-1.0/libgstsmoothstreaming.so
    usr/lib32/gstreamer-1.0/libgstsndfile.so
    usr/lib32/gstreamer-1.0/libgstsoundtouch.so
    usr/lib32/gstreamer-1.0/libgstspandsp.so
    usr/lib32/gstreamer-1.0/libgstsrt.so
    usr/lib32/gstreamer-1.0/libgstsrtp.so
    usr/lib32/gstreamer-1.0/libgstteletext.so
    usr/lib32/gstreamer-1.0/libgsttimecode.so
    usr/lib32/gstreamer-1.0/libgstttmlsubs.so
    usr/lib32/gstreamer-1.0/libgstvulkan.so
    usr/lib32/gstreamer-1.0/libgstwaylandsink.so
    usr/lib32/gstreamer-1.0/libgstwebp.so
    usr/lib32/gstreamer-1.0/libgstwebrtc.so
    usr/lib32/gstreamer-1.0/libgstwebrtcdsp.so
    usr/lib32/gstreamer-1.0/libgstwildmidi.so
    usr/lib32/gstreamer-1.0/libgstx265.so
    usr/lib32/gstreamer-1.0/libgstzbar.so
  ); _install
}

package_lib32-gst-plugin-gtk-git() {
  pkgdesc+=" - gtk plugin"
  depends=("lib32-gst-plugins-base-libs-git=$pkgver" lib32-gtk3)
  provides=("lib32-gst-plugin-gtk=$pkgver")
  conflicts=("lib32-gst-plugin-gtk")

  cd root; local files=(
    usr/lib32/gstreamer-1.0/libgstgtk.so
  ); _install
}

package_lib32-gst-plugin-va-git() {
  pkgdesc+=" - va plugin"
  depends=("lib32-gst-plugins-bad-libs-git=$pkgver" lib32-libva)
  provides=("lib32-gst-plugin-va=$pkgver")
  conflicts=("lib32-gst-plugin-va")

  cd root; local files=(
    usr/lib32/libgstva-1.0.so*

    usr/lib32/gstreamer-1.0/libgstva.so
  ); _install
}

package_lib32-gst-plugins-ugly-git() {
  pkgdesc+=" - ugly plugins"
  depends=(
    "lib32-gst-plugins-base-libs-git=$pkgver"
    lib32-libdvdread lib32-libmpeg2 lib32-a52dec lib32-libsidplay lib32-libcdio lib32-x264 lib32-opencore-amr
  )
  provides=("lib32-gst-plugins-ugly=$pkgver")
  conflicts=("lib32-gst-plugins-ugly")

  cd root; local files=(
    usr/lib32/gstreamer-1.0/libgsta52dec.so
    usr/lib32/gstreamer-1.0/libgstamrnb.so
    usr/lib32/gstreamer-1.0/libgstamrwbdec.so
    usr/lib32/gstreamer-1.0/libgstasf.so
    usr/lib32/gstreamer-1.0/libgstcdio.so
    usr/lib32/gstreamer-1.0/libgstdvdlpcmdec.so
    usr/lib32/gstreamer-1.0/libgstdvdread.so
    usr/lib32/gstreamer-1.0/libgstdvdsub.so
    usr/lib32/gstreamer-1.0/libgstmpeg2dec.so
    usr/lib32/gstreamer-1.0/libgstrealmedia.so
    usr/lib32/gstreamer-1.0/libgstsid.so
    usr/lib32/gstreamer-1.0/libgstx264.so
    usr/lib32/gstreamer-1.0/libgstxingmux.so
  ); _install
}

package_lib32-gst-libav-git() {
  pkgdesc+=" - libav plugin"
  depends=("lib32-gst-plugins-base-libs-git=$pkgver" lib32-bzip2 lib32-ffmpeg)
  provides=("lib32-gst-ffmpeg=$pkgver")
  conflicts=("lib32-gst-libav")

  cd root; local files=(
    usr/lib32/gstreamer-1.0/libgstlibav.so
  ); _install
}

package_lib32-gst-rtsp-server-git() {
  pkgdesc+=" - rtsp server"
  depends=("lib32-gst-plugins-base-libs-git=$pkgver")
  provides=("lib32-gst-rtsp-server=$pkgver")
  conflicts=("lib32-gst-rtsp-server")
  
  cd root; local files=(
    usr/lib32/libgstrtspserver-1.0.so*
    usr/lib32/pkgconfig/gstreamer-rtsp-server-1.0.pc

    usr/lib32/gstreamer-1.0/libgstrtspclientsink.so
  ); _install
}

package_lib32-gstreamer-vaapi-git() {
  pkgdesc+=" - vaapi plugin"
  depends=("lib32-gst-plugins-bad-libs-git=$pkgver" lib32-libva lib32-libxrandr)
  provides=("lib32-gstreamer-vaapi=$pkgver")
  conflicts=("lib32-gstreamer-vaapi")

  cd root; local files=(
    # usr/lib32/gstreamer-1.0/pkgconfig/gstvaapi.pc
    usr/lib32/gstreamer-1.0/libgstvaapi.so
  ); _install
}
