# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gstreamer-git
pkgname=(
  gstreamer-git
  gst-plugins-bad-libs-git   # Split badaudio first
  gst-plugins-base-libs-git
  gst-plugins-base-git
  gst-plugins-good-git
  gst-plugins-bad-git
  gst-plugin-gtk-git
  gst-plugin-msdk-git
  gst-plugin-opencv-git
  gst-plugin-qmlgl-git
  gst-plugin-va-git
  gst-plugin-wpe-git
  gst-plugin-cuda-git
  gst-plugins-ugly-git
  gst-libav-git
  gst-rtsp-server-git
  gstreamer-vaapi-git
  gst-editing-services-git
  gst-python-git
  gst-devtools-git
  gstreamer-docs-git
)
pkgver=1.21.3.r66.g3fa6651d91
pkgrel=1
_pkgver=1.21.1
pkgdesc='GStreamer Multimedia Framework (Git version)'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/'
makedepends=(
  # superproject
  git meson hotdoc cython

  # gstreamer
  valgrind libunwind gobject-introspection bash-completion gtk3 libcap python

  # gst-plugins-base
  cdparanoia graphene libvisual opus libtheora libxv sdl2 qt5-base qt5-tools
  zlib libglvnd wayland wayland-protocols libx11 libgudev libdrm mesa orc libtremor-git

  # gst-plugins-good
  nasm v4l-utils aalib flac jack2 lame libcaca libdv mpg123 libraw1394
  libavc1394 libiec61883 qt5-declarative qt5-x11extras qt5-wayland libpulse
  libshout taglib twolame libvpx wavpack cairo libsoup3

  # gst-plugins-bad
  opencv vulkan-icd-loader vulkan-headers vulkan-validation-layers shaderc
  libltc bluez-libs libavtp libbs2b bzip2 chromaprint libdca faac faad2
  libfdk-aac fluidsynth libgme libkate liblrdf ladspa libde265 lilv lv2
  libmicrodns mjpegtools libmpcdec neon openal libdvdnav rtmpdump sbc soundtouch
  spandsp libsrtp svt-hevc zvbi webrtc-audio-processing wildmidi
  zxing-cpp zbar nettle libxml2 gsm libopenmpt wpewebkit libldac libfreeaptx
  qrencode json-glib libva libxkbcommon-x11 openh264 openni2 vo-aacenc libnice

  # gst-plugins-ugly
  a52dec opencore-amr libcdio libdvdread libmpeg2 libsidplay x264

  # gst-libav
     glibc alsa-lib jack libpng ffmpeg
     bzip2 frei0r-plugins libgcrypt gmp gnutls ladspa libass aom
     libbluray libbs2b libcaca celt libcdio-paranoia libdc1394
     libavc1394 libfdk-aac fontconfig freetype2 fribidi libgme gsm
     libiec61883 libmodplug lame opencore-amr openjpeg2 opus pulseaudio
     librsvg rubberband rtmpdump smbclient snappy libsoxr speex srt
     libssh tesseract libtheora twolame v4l-utils vid.stab libvorbis
     libvpx wavpack libwebp libx264.so x265 libxcb xvidcore libxml2
     zimg zeromq zvbi lv2 lilv xz openal ocl-icd libgl sndio
     sdl2 libxv libx11 libxext zlib libomxil-bellagio libva libdrm
     libvdpau
  # AUR:
    chromaprint-fftw codec2 flite1 libilbc kvazaar openh264
    libopenmpt shine vo-amrwbenc xavs ndi-sdk libmysofa
    rockchip-mpp

  # gstreamer-vaapi
  libxrandr

  # gst-python
  python-gobject
)

_gitname='gstreamer'

source=('git+https://gitlab.freedesktop.org/gstreamer/gstreamer'
        "https://gstreamer.freedesktop.org/src/gstreamer-docs/gstreamer-docs-${_pkgver%%+*}.tar.xz")
md5sums=('SKIP'
         '6d123b1279d3f53bf677043b0d7a6686')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D devtools=disabled
    -D doc=disabled
    -D examples=disabled
    -D gpl=enabled
    -D gst-examples=disabled
    -D libnice=disabled
    -D orc-source=system
    -D vaapi=enabled
    -D gst-devtools:validate=disabled
    -D gstreamer:dbghelp=disabled
    -D gstreamer:gobject-cast-checks=disabled
    -D gstreamer:package-name="Arch Linux gstreamer $pkgver-$pkgrel"
    -D gstreamer:package-origin="https://www.archlinux.org/"
    -D gstreamer:ptp-helper-permissions=capabilities
    -D gst-plugins-base:gobject-cast-checks=disabled
    -D gst-plugins-base:package-name="Arch Linux gst-plugins-base $pkgver-$pkgrel"
    -D gst-plugins-base:package-origin="https://www.archlinux.org/"
    -D gst-plugins-base:tremor=enabled
    -D gst-plugins-good:gobject-cast-checks=disabled
    -D gst-plugins-good:package-name="Arch Linux gst-plugins-good $pkgver-$pkgrel"
    -D gst-plugins-good:package-origin="https://www.archlinux.org/"
    -D gst-plugins-good:rpicamsrc=disabled
    -D gst-plugins-bad:directfb=disabled
    -D gst-plugins-bad:gobject-cast-checks=disabled
    -D gst-plugins-bad:gs=disabled
    -D gst-plugins-bad:iqa=disabled
    -D gst-plugins-bad:isac=disabled
    -D gst-plugins-bad:magicleap=disabled
    -D gst-plugins-bad:onnx=disabled
    -D gst-plugins-bad:opensles=disabled
    -D gst-plugins-bad:package-name="Arch Linux gst-plugins-bad $pkgver-$pkgrel"
    -D gst-plugins-bad:package-origin="https://www.archlinux.org/"
    -D gst-plugins-bad:tinyalsa=disabled
    -D gst-plugins-bad:wasapi2=disabled
    -D gst-plugins-bad:wasapi=disabled
    -D gst-plugins-bad:directshow=disabled
    -D gst-plugins-bad:amfcodec=disabled
    -D gst-plugins-ugly:gobject-cast-checks=disabled
    -D gst-plugins-ugly:package-name="Arch Linux gst-plugins-ugly $pkgver-$pkgrel"
    -D gst-plugins-ugly:package-origin="https://www.archlinux.org/"
    -D gst-libav:package-name="Arch Linux gst-libav $pkgver-$pkgrel"
    -D gst-libav:package-origin="https://www.archlinux.org/"
    -D gst-rtsp-server:gobject-cast-checks=disabled
    -D gst-rtsp-server:package-name="Arch Linux gst-rtsp-server $pkgver-$pkgrel"
    -D gst-rtsp-server:package-origin="https://www.archlinux.org/"
    -D gst-editing-services:validate=disabled
    -D gstreamer-vaapi:package-origin="https://www.archlinux.org/"
  )

  arch-meson gstreamer build "${meson_options[@]}"
  meson compile -C build
}
#check() {
#  cd $_gitname
#  make check
#}

_install() {
  local src dir
  for src in "${files[@]}"; do
    dir="$pkgdir/$(dirname "$src")"
    mkdir -p "$dir"
    mv -v "$src" "$dir"
  done
}

package_gstreamer-git() {
  pkgdesc+=" - core"
  depends=(libxml2 glib2 libunwind libcap libelf)
  optdepends=('python: gst-plugins-doc-cache-generator')
  conflicts=('gstreamer')
  install=gstreamer.install

  DESTDIR="$srcdir/root" meson install -C build

  cd root; local files=(
    usr/include/gstreamer-1.0/gst/{base,check,controller,net,*.h}
    usr/lib/libgst{reamer,base,check,controller,net}-1.0.so*
    usr/lib/pkgconfig/gstreamer{,-base,-check,-controller,-net}-1.0.pc
    usr/lib/girepository-1.0/Gst{,Base,Check,Controller,Net}-1.0.typelib
    usr/share/gir-1.0/Gst{,Base,Check,Controller,Net}-1.0.gir

    usr/lib/gstreamer-1.0/gst-{completion,ptp}-helper
    usr/lib/gstreamer-1.0/gst-{hotdoc-plugins,plugin}-scanner
    usr/lib/gstreamer-1.0/gst-plugins-doc-cache-generator
    usr/lib/gstreamer-1.0/libgstcoreelements.so
    usr/lib/gstreamer-1.0/libgstcoretracers.so

    usr/share/locale/*/LC_MESSAGES/gstreamer-1.0.mo

    usr/bin/gst-{inspect,launch,stats,tester,typefind}-1.0
    usr/share/man/man1/gst-{inspect,launch,stats,typefind}-1.0.1

    usr/share/bash-completion/completions/gst-{inspect,launch}-1.0
    usr/share/bash-completion/helpers/gst

    usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so*.py
    usr/share/gstreamer-1.0/gdb/glib_gobject_helper.py
    usr/share/gstreamer-1.0/gdb/gst_gdb.py

    usr/share/aclocal/gst-element-check-1.0.m4
  ); _install
}

package_gst-plugins-bad-libs-git() {
  pkgdesc+=" - bad"
  depends=(
    "gst-plugins-base-libs-git=$pkgver"
    orc libdrm libx11 libgudev libusb libxkbcommon-x11 libnice
  )
  conficts=('gst-plugin-bad-libs')

  cd root; local files=(
    usr/include/gstreamer-1.0/gst/audio/{audio-bad-prelude,gstnonstreamaudiodecoder,gstplanaraudioadapter}.h
    usr/include/gstreamer-1.0/gst/{basecamerabinsrc,codecparsers,insertbin,interfaces,isoff,mpegts,play,player,sctp,transcoder,uridownloader,vulkan,wayland,webrtc}
    usr/lib/libgst{adaptivedemux,badaudio,basecamerabinsrc,codecparsers,codecs,insertbin,isoff,mpegts,photography,play,player,sctp,transcoder,uridownloader,vulkan,wayland,webrtc,webrtcnice,cuda}-1.0.so*
    usr/lib/pkgconfig/gstreamer-{bad-audio,codecparsers,insertbin,mpegts,photography,play,player,sctp,transcoder,vulkan{,-wayland,-xcb},wayland,webrtc,webrtc-nice}-1.0.pc
    usr/lib/girepository-1.0/Gst{BadAudio,Codecs,InsertBin,Mpegts,Play,Player,Transcoder,Vulkan{,Wayland,XCB},WebRTC}-1.0.typelib
    usr/share/gir-1.0/Gst{BadAudio,Codecs,InsertBin,Mpegts,Play,Player,Transcoder,Vulkan{,Wayland,XCB},WebRTC}-1.0.gir
    usr/lib/gstreamer-1.0/libgstadaptivedemux2.so
    usr/lib/pkgconfig/gstreamer-plugins-bad-1.0.pc
    usr/lib/gstreamer-1.0/libgstaccurip.so
    usr/lib/gstreamer-1.0/libgstadpcmdec.so
    usr/lib/gstreamer-1.0/libgstadpcmenc.so
    usr/lib/gstreamer-1.0/libgstaiff.so
    usr/lib/gstreamer-1.0/libgstasfmux.so
    usr/lib/gstreamer-1.0/libgstaudiobuffersplit.so
    usr/lib/gstreamer-1.0/libgstaudiofxbad.so
    usr/lib/gstreamer-1.0/libgstaudiolatency.so
    usr/lib/gstreamer-1.0/libgstaudiomixmatrix.so
    usr/lib/gstreamer-1.0/libgstaudiovisualizers.so
    usr/lib/gstreamer-1.0/libgstautoconvert.so
    usr/lib/gstreamer-1.0/libgstbayer.so
    usr/lib/gstreamer-1.0/libgstbluez.so
    usr/lib/gstreamer-1.0/libgstcamerabin.so
    usr/lib/gstreamer-1.0/libgstcodecalpha.so
    usr/lib/gstreamer-1.0/libgstcoloreffects.so
    usr/lib/gstreamer-1.0/libgstdebugutilsbad.so
    usr/lib/gstreamer-1.0/libgstdecklink.so
    usr/lib/gstreamer-1.0/libgstdvb.so
    usr/lib/gstreamer-1.0/libgstdvbsubenc.so
    usr/lib/gstreamer-1.0/libgstdvbsuboverlay.so
    usr/lib/gstreamer-1.0/libgstdvdspu.so
    usr/lib/gstreamer-1.0/libgstfaceoverlay.so
    usr/lib/gstreamer-1.0/libgstfbdevsink.so
    usr/lib/gstreamer-1.0/libgstfestival.so
    usr/lib/gstreamer-1.0/libgstfieldanalysis.so
    usr/lib/gstreamer-1.0/libgstfreeverb.so
    usr/lib/gstreamer-1.0/libgstfrei0r.so
    usr/lib/gstreamer-1.0/libgstgaudieffects.so
    usr/lib/gstreamer-1.0/libgstgdp.so
    usr/lib/gstreamer-1.0/libgstgeometrictransform.so
    usr/lib/gstreamer-1.0/libgstid3tag.so
    usr/lib/gstreamer-1.0/libgstinter.so
    usr/lib/gstreamer-1.0/libgstinterlace.so
    usr/lib/gstreamer-1.0/libgstipcpipeline.so
    usr/lib/gstreamer-1.0/libgstivfparse.so
    usr/lib/gstreamer-1.0/libgstivtc.so
    usr/lib/gstreamer-1.0/libgstjp2kdecimator.so
    usr/lib/gstreamer-1.0/libgstjpegformat.so
    usr/lib/gstreamer-1.0/libgstkms.so
    usr/lib/gstreamer-1.0/libgstlegacyrawparse.so
    usr/lib/gstreamer-1.0/libgstmidi.so
    usr/lib/gstreamer-1.0/libgstmpegpsdemux.so
    usr/lib/gstreamer-1.0/libgstmpegpsmux.so
    usr/lib/gstreamer-1.0/libgstmpegtsdemux.so
    usr/lib/gstreamer-1.0/libgstmpegtsmux.so
    usr/lib/gstreamer-1.0/libgstmxf.so
    usr/lib/gstreamer-1.0/libgstnetsim.so
    usr/lib/gstreamer-1.0/libgstnvcodec.so
    usr/lib/gstreamer-1.0/libgstpcapparse.so
    usr/lib/gstreamer-1.0/libgstpnm.so
    usr/lib/gstreamer-1.0/libgstproxy.so
    usr/lib/gstreamer-1.0/libgstremovesilence.so
    usr/lib/gstreamer-1.0/libgstrfbsrc.so
    usr/lib/gstreamer-1.0/libgstrist.so
    usr/lib/gstreamer-1.0/libgstrtmp2.so
    usr/lib/gstreamer-1.0/libgstrtpmanagerbad.so
    usr/lib/gstreamer-1.0/libgstrtponvif.so
    usr/lib/gstreamer-1.0/libgstsdpelem.so
    usr/lib/gstreamer-1.0/libgstsegmentclip.so
    usr/lib/gstreamer-1.0/libgstshm.so
    usr/lib/gstreamer-1.0/libgstsiren.so
    usr/lib/gstreamer-1.0/libgstsmooth.so
    usr/lib/gstreamer-1.0/libgstspeed.so
    usr/lib/gstreamer-1.0/libgstsubenc.so
    usr/lib/gstreamer-1.0/libgstswitchbin.so
    usr/lib/gstreamer-1.0/libgsttranscode.so
    usr/lib/gstreamer-1.0/libgstuvch264.so
    usr/lib/gstreamer-1.0/libgstv4l2codecs.so
    usr/lib/gstreamer-1.0/libgstvideofiltersbad.so
    usr/lib/gstreamer-1.0/libgstvideoframe_audiolevel.so
    usr/lib/gstreamer-1.0/libgstvideoparsersbad.so
    usr/lib/gstreamer-1.0/libgstvideosignal.so
    usr/lib/gstreamer-1.0/libgstvmnc.so
    usr/lib/gstreamer-1.0/libgsty4mdec.so
    usr/lib/gstreamer-1.0/libgstcodectimestamper.so


    usr/share/gstreamer-1.0/encoding-profiles
    usr/share/gstreamer-1.0/presets/GstFreeverb.prs

    usr/share/locale/*/LC_MESSAGES/gst-plugins-bad-1.0.mo

    usr/bin/gst-transcoder-1.0
  ); _install
}

package_gst-plugins-base-libs-git() {
  pkgdesc+=" - base"
  depends=(
    "gstreamer-git=$pkgver"
    orc libxv iso-codes libgudev libgl mesa libxi
  )
  conficts=('gst-plguin-base-lib')

  cd root; local files=(
    usr/include/gstreamer-1.0/gst/{allocators,app,audio,fft,gl,pbutils,riff,rtp,rtsp,sdp,tag,video}
    usr/lib/libgst{allocators,app,audio,fft,gl,pbutils,riff,rtp,rtsp,sdp,tag,video}-1.0.so*
    usr/lib/pkgconfig/gstreamer-{allocators,app,audio,fft,gl{,-egl,-prototypes,-wayland,-x11},pbutils,riff,rtp,rtsp,sdp,tag,video}-1.0.pc
    usr/lib/girepository-1.0/Gst{Allocators,App,Audio,GL{,EGL,Wayland,X11},Pbutils,Rtp,Rtsp,Sdp,Tag,Video}-1.0.typelib
    usr/share/gir-1.0/Gst{Allocators,App,Audio,GL{,EGL,Wayland,X11},Pbutils,Rtp,Rtsp,Sdp,Tag,Video}-1.0.gir

    usr/lib/pkgconfig/gstreamer-plugins-base-1.0.pc
    usr/lib/gstreamer-1.0/include/gst/gl/gstglconfig.h
    usr/lib/gstreamer-1.0/libgstadder.so
    usr/lib/gstreamer-1.0/libgstapp.so
    usr/lib/gstreamer-1.0/libgstaudioconvert.so
    usr/lib/gstreamer-1.0/libgstaudiomixer.so
    usr/lib/gstreamer-1.0/libgstaudiorate.so
    usr/lib/gstreamer-1.0/libgstaudioresample.so
    usr/lib/gstreamer-1.0/libgstaudiotestsrc.so
    usr/lib/gstreamer-1.0/libgstcompositor.so
    usr/lib/gstreamer-1.0/libgstencoding.so
    usr/lib/gstreamer-1.0/libgstgio.so
    usr/lib/gstreamer-1.0/libgstoverlaycomposition.so
    usr/lib/gstreamer-1.0/libgstpbtypes.so
    usr/lib/gstreamer-1.0/libgstplayback.so
    usr/lib/gstreamer-1.0/libgstrawparse.so
    usr/lib/gstreamer-1.0/libgstsubparse.so
    usr/lib/gstreamer-1.0/libgsttcp.so
    usr/lib/gstreamer-1.0/libgsttypefindfunctions.so
    usr/lib/gstreamer-1.0/libgstvideorate.so
    usr/lib/gstreamer-1.0/libgstvideoconvertscale.so
    usr/lib/gstreamer-1.0/libgstvideotestsrc.so
    usr/lib/gstreamer-1.0/libgstvolume.so
    usr/lib/gstreamer-1.0/libgstximagesink.so
    usr/lib/gstreamer-1.0/libgstxvimagesink.so

    usr/share/locale/*/LC_MESSAGES/gst-plugins-base-1.0.mo

    usr/bin/gst-{device-monitor,discoverer,play}-1.0
    usr/share/man/man1/gst-{device-monitor,discoverer,play}-1.0.1

    usr/share/gst-plugins-base
  ); _install
}

package_gst-plugins-base-git() {
  pkgdesc+=" - base plugins"
  depends=(
    "gst-plugins-base-libs-git=$pkgver"
    alsa-lib cdparanoia libvisual libvorbis libtheora pango opus graphene libpng
    libjpeg libtremor-git
  )
  conflicts=('gst-plugin-base')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstalsa.so
    usr/lib/gstreamer-1.0/libgstcdparanoia.so
    usr/lib/gstreamer-1.0/libgstlibvisual.so
    usr/lib/gstreamer-1.0/libgstogg.so
    usr/lib/gstreamer-1.0/libgstopengl.so
    usr/lib/gstreamer-1.0/libgstopus.so
    usr/lib/gstreamer-1.0/libgstpango.so
    usr/lib/gstreamer-1.0/libgsttheora.so
    usr/lib/gstreamer-1.0/libgstvorbis.so
    usr/lib/gstreamer-1.0/libgstivorbisdec.so
  ); _install
}

package_gst-plugins-good-git() {
  pkgdesc+=" - good plugins"
  depends=(
    "gst-plugins-base-libs-git=$pkgver"
    libpulse libsoup3 gst-plugins-base-libs wavpack aalib taglib libdv libshout
    libvpx gdk-pixbuf2 libcaca libavc1394 libiec61883 libxdamage v4l-utils cairo
    libgudev speex flac libraw1394 lame mpg123 twolame qt6-wayland
    libjack.so
  )
  conflicts=('gst-plugin-good')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgst1394.so
    usr/lib/gstreamer-1.0/libgstaasink.so
    usr/lib/gstreamer-1.0/libgstalaw.so
    usr/lib/gstreamer-1.0/libgstalpha.so
    usr/lib/gstreamer-1.0/libgstalphacolor.so
    usr/lib/gstreamer-1.0/libgstapetag.so
    usr/lib/gstreamer-1.0/libgstaudiofx.so
    usr/lib/gstreamer-1.0/libgstaudioparsers.so
    usr/lib/gstreamer-1.0/libgstauparse.so
    usr/lib/gstreamer-1.0/libgstautodetect.so
    usr/lib/gstreamer-1.0/libgstavi.so
    usr/lib/gstreamer-1.0/libgstcacasink.so
    usr/lib/gstreamer-1.0/libgstcairo.so
    usr/lib/gstreamer-1.0/libgstcutter.so
    usr/lib/gstreamer-1.0/libgstdebug.so
    usr/lib/gstreamer-1.0/libgstdeinterlace.so
    usr/lib/gstreamer-1.0/libgstdtmf.so
    usr/lib/gstreamer-1.0/libgstdv.so
    usr/lib/gstreamer-1.0/libgsteffectv.so
    usr/lib/gstreamer-1.0/libgstequalizer.so
    usr/lib/gstreamer-1.0/libgstflac.so
    usr/lib/gstreamer-1.0/libgstflv.so
    usr/lib/gstreamer-1.0/libgstflxdec.so
    usr/lib/gstreamer-1.0/libgstgdkpixbuf.so
    usr/lib/gstreamer-1.0/libgstgoom.so
    usr/lib/gstreamer-1.0/libgstgoom2k1.so
    usr/lib/gstreamer-1.0/libgsticydemux.so
    usr/lib/gstreamer-1.0/libgstid3demux.so
    usr/lib/gstreamer-1.0/libgstimagefreeze.so
    usr/lib/gstreamer-1.0/libgstinterleave.so
    usr/lib/gstreamer-1.0/libgstisomp4.so
    usr/lib/gstreamer-1.0/libgstjack.so
    usr/lib/gstreamer-1.0/libgstjpeg.so
    usr/lib/gstreamer-1.0/libgstlame.so
    usr/lib/gstreamer-1.0/libgstlevel.so
    usr/lib/gstreamer-1.0/libgstmatroska.so
    usr/lib/gstreamer-1.0/libgstmonoscope.so
    usr/lib/gstreamer-1.0/libgstmpg123.so
    usr/lib/gstreamer-1.0/libgstmulaw.so
    usr/lib/gstreamer-1.0/libgstmultifile.so
    usr/lib/gstreamer-1.0/libgstmultipart.so
    usr/lib/gstreamer-1.0/libgstnavigationtest.so
    usr/lib/gstreamer-1.0/libgstoss4.so
    usr/lib/gstreamer-1.0/libgstossaudio.so
    usr/lib/gstreamer-1.0/libgstpng.so
    usr/lib/gstreamer-1.0/libgstpulseaudio.so
    usr/lib/gstreamer-1.0/libgstreplaygain.so
    usr/lib/gstreamer-1.0/libgstrtp.so
    usr/lib/gstreamer-1.0/libgstrtpmanager.so
    usr/lib/gstreamer-1.0/libgstrtsp.so
    usr/lib/gstreamer-1.0/libgstshapewipe.so
    usr/lib/gstreamer-1.0/libgstshout2.so
    usr/lib/gstreamer-1.0/libgstsmpte.so
    usr/lib/gstreamer-1.0/libgstsoup.so
    usr/lib/gstreamer-1.0/libgstspectrum.so
    usr/lib/gstreamer-1.0/libgstspeex.so
    usr/lib/gstreamer-1.0/libgsttaglib.so
    usr/lib/gstreamer-1.0/libgsttwolame.so
    usr/lib/gstreamer-1.0/libgstudp.so
    usr/lib/gstreamer-1.0/libgstvideo4linux2.so
    usr/lib/gstreamer-1.0/libgstvideobox.so
    usr/lib/gstreamer-1.0/libgstvideocrop.so
    usr/lib/gstreamer-1.0/libgstvideofilter.so
    usr/lib/gstreamer-1.0/libgstvideomixer.so
    usr/lib/gstreamer-1.0/libgstvpx.so
    usr/lib/gstreamer-1.0/libgstwavenc.so
    usr/lib/gstreamer-1.0/libgstwavpack.so
    usr/lib/gstreamer-1.0/libgstwavparse.so
    usr/lib/gstreamer-1.0/libgstximagesrc.so
    usr/lib/gstreamer-1.0/libgsty4menc.so
    usr/lib/gstreamer-1.0/libgstqml6.so


    usr/share/gstreamer-1.0/presets/GstIirEqualizer{3,10}Bands.prs
    usr/share/gstreamer-1.0/presets/Gst{QTMux,VP8Enc}.prs

    usr/share/locale/*/LC_MESSAGES/gst-plugins-good-1.0.mo
  ); _install
}

package_gst-plugins-bad-git() {
  pkgdesc+=" - bad plugins"
  depends=(
    "gst-plugins-bad-libs-git=$pkgver"
    aom libass libbs2b bzip2 chromaprint pango lcms2 curl libxml2 libdc1394
    libde265 openssl libdca faac faad2 libfdk-aac fluidsynth libgme nettle
    libkate liblrdf lilv libmodplug mjpegtools libmpcdec neon openal openexr
    openjpeg2 opus libdvdnav libdvdread librsvg rtmpdump sbc libsndfile libltc
    soundtouch spandsp srt libsrtp zvbi vulkan-icd-loader libxcb wayland libwebp
    libnice webrtc-audio-processing wildmidi x265 zbar gsm libopenmpt libldac
    libfreeaptx qrencode json-glib libavtp libmicrodns svt-hevc zxing-cpp vo-aacenc
    openni2 gtk3 vo-amrwbenc openh264 flite1
  )
  conficts=('gst-plugins-bad')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstaes.so
    usr/lib/gstreamer-1.0/libgstaom.so
    usr/lib/gstreamer-1.0/libgstassrender.so
    usr/lib/gstreamer-1.0/libgstavtp.so
    usr/lib/gstreamer-1.0/libgstbs2b.so
    usr/lib/gstreamer-1.0/libgstbz2.so
    usr/lib/gstreamer-1.0/libgstchromaprint.so
    usr/lib/gstreamer-1.0/libgstclosedcaption.so
    usr/lib/gstreamer-1.0/libgstcolormanagement.so
    usr/lib/gstreamer-1.0/libgstcurl.so
    usr/lib/gstreamer-1.0/libgstdash.so
    usr/lib/gstreamer-1.0/libgstdc1394.so
    usr/lib/gstreamer-1.0/libgstde265.so
    usr/lib/gstreamer-1.0/libgstdtls.so
    usr/lib/gstreamer-1.0/libgstdtsdec.so
    usr/lib/gstreamer-1.0/libgstfaac.so
    usr/lib/gstreamer-1.0/libgstfaad.so
    usr/lib/gstreamer-1.0/libgstfdkaac.so
    usr/lib/gstreamer-1.0/libgstfluidsynthmidi.so
    usr/lib/gstreamer-1.0/libgstgme.so
    usr/lib/gstreamer-1.0/libgstgsm.so
    usr/lib/gstreamer-1.0/libgsthls.so
    usr/lib/gstreamer-1.0/libgstkate.so
    usr/lib/gstreamer-1.0/libgstladspa.so
    usr/lib/gstreamer-1.0/libgstldac.so
    usr/lib/gstreamer-1.0/libgstlv2.so
    usr/lib/gstreamer-1.0/libgstmicrodns.so
    usr/lib/gstreamer-1.0/libgstmodplug.so
    usr/lib/gstreamer-1.0/libgstmpeg2enc.so
    usr/lib/gstreamer-1.0/libgstmplex.so
    usr/lib/gstreamer-1.0/libgstmusepack.so
    usr/lib/gstreamer-1.0/libgstneonhttpsrc.so
    usr/lib/gstreamer-1.0/libgstopenal.so
    usr/lib/gstreamer-1.0/libgstopenaptx.so
    usr/lib/gstreamer-1.0/libgstopenexr.so
    usr/lib/gstreamer-1.0/libgstopenjpeg.so
    usr/lib/gstreamer-1.0/libgstopenmpt.so
    usr/lib/gstreamer-1.0/libgstopusparse.so
    usr/lib/gstreamer-1.0/libgstqroverlay.so
    usr/lib/gstreamer-1.0/libgstresindvd.so
    usr/lib/gstreamer-1.0/libgstrsvg.so
    usr/lib/gstreamer-1.0/libgstrtmp.so
    usr/lib/gstreamer-1.0/libgstsbc.so
    usr/lib/gstreamer-1.0/libgstsctp.so
    usr/lib/gstreamer-1.0/libgstsmoothstreaming.so
    usr/lib/gstreamer-1.0/libgstsndfile.so
    usr/lib/gstreamer-1.0/libgstsoundtouch.so
    usr/lib/gstreamer-1.0/libgstspandsp.so
    usr/lib/gstreamer-1.0/libgstsrt.so
    usr/lib/gstreamer-1.0/libgstsrtp.so
    usr/lib/gstreamer-1.0/libgstsvthevcenc.so
    usr/lib/gstreamer-1.0/libgstteletext.so
    usr/lib/gstreamer-1.0/libgsttimecode.so
    usr/lib/gstreamer-1.0/libgstttmlsubs.so
    usr/lib/gstreamer-1.0/libgstvulkan.so
    usr/lib/gstreamer-1.0/libgstwaylandsink.so
    usr/lib/gstreamer-1.0/libgstgtkwayland.so
    usr/lib/gstreamer-1.0/libgstwebp.so
    usr/lib/gstreamer-1.0/libgstwebrtc.so
    usr/lib/gstreamer-1.0/libgstwebrtcdsp.so
    usr/lib/gstreamer-1.0/libgstwildmidi.so
    usr/lib/gstreamer-1.0/libgstx265.so
    usr/lib/gstreamer-1.0/libgstzbar.so
    usr/lib/gstreamer-1.0/libgstzxing.so
    usr/lib/gstreamer-1.0/libgstflite.so
    usr/lib/gstreamer-1.0/libgstopenh264.so
    usr/lib/gstreamer-1.0/libgstopenni2.so
    usr/lib/gstreamer-1.0/libgstvoaacenc.so
    usr/lib/gstreamer-1.0/libgstvoamrwbenc.so
    usr/lib/gstreamer-1.0/libgstqsv.so

    usr/share/gstreamer-1.0/presets/GstVoAmrwbEnc.prs

  ); _install
}

package_gst-plugin-gtk-git() {
  pkgdesc+=" - gtk plugin"
  depends=("gst-plugins-base-libs-git=$pkgver" gtk3)
  conflicts=('gst-plugin-gtk')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstgtk.so
  ); _install
}

package_gst-plugin-msdk-git() {
  pkgdesc+=" - msdk plugin"
  depends=("gst-plugins-bad-libs-git=$pkgver" libmfx libva)
  conflicts=('gst-plugin-msdk')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstmsdk.so
  ); _install
}

package_gst-plugin-opencv-git() {
  pkgdesc+=" - opencv plugin"
  depends=("gst-plugins-base-libs-git=$pkgver" opencv)
  conflicts=('gst-plugin-opencv')

  cd root; local files=(
    usr/include/gstreamer-1.0/gst/opencv
    usr/lib/libgstopencv-1.0.so*

    usr/lib/gstreamer-1.0/libgstopencv.so
  ); _install
}

package_gst-plugin-qmlgl-git() {
  pkgdesc+=" - qmlgl plugin"
  depends=(
    "gst-plugins-base-libs-git=$pkgver"
    qt5-declarative qt5-x11extras qt5-wayland
  )
  conflicts=("gst-plugin-qmlgl")

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstqmlgl.so
  ); _install
}

package_gst-plugin-va-git() {
  pkgdesc+=" - va plugin"
  depends=("gst-plugins-bad-libs-git=$pkgver" libva)
  conflicts=("gst-plugin-va")

  cd root; local files=(
    usr/lib/libgstva-1.0.so*

    usr/lib/gstreamer-1.0/libgstva.so
  ); _install
}

package_gst-plugin-cuda-git() {
  pkgdesc+=" - cuda plugin"
  depends=("gst-plugins-bad-libs=$pkgver" cuda)
  conflicts=("gst-plugin-cuda")

  cd root; local files=(
    usr/include/gstreamer-1.0/gst/cuda/cuda-prelude.h
    usr/include/gstreamer-1.0/gst/cuda/gstcudabufferpool.h
    usr/include/gstreamer-1.0/gst/cuda/gstcudacontext.h
    usr/include/gstreamer-1.0/gst/cuda/gstcudaloader.h
    usr/include/gstreamer-1.0/gst/cuda/gstcudamemory.h
    usr/include/gstreamer-1.0/gst/cuda/gstcudautils.h
    usr/include/gstreamer-1.0/gst/cuda/cuda-gst.h
    usr/include/gstreamer-1.0/gst/cuda/gstcudanvrtc.h

    usr/lib/girepository-1.0/CudaGst-1.0.typelib
    usr/lib/girepository-1.0/GstCuda-1.0.typelib
    usr/lib/pkgconfig/gstreamer-cuda-1.0.pc

    usr/share/gir-1.0/CudaGst-1.0.gir
    usr/share/gir-1.0/GstCuda-1.0.gir
); _install
}
package_gst-plugin-wpe-git() {
  pkgdesc+=" - wpe plugin"
  depends=("gst-plugins-base-libs-git=$pkgver" wpewebkit)
  conficts=('gst-plugin-wpe')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstwpe.so
    usr/lib/gst-plugins-bad/wpe-extension/libgstwpeextension.so
  ); _install
}

package_gst-plugins-ugly-git() {
  pkgdesc+=" - ugly plugins"
  depends=(
    "gst-plugins-base-libs-git=$pkgver"
    libdvdread libmpeg2 a52dec libsidplay libcdio x264 opencore-amr
  )
  conflicts=('gst-plugins-ugly')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgsta52dec.so
    usr/lib/gstreamer-1.0/libgstamrnb.so
    usr/lib/gstreamer-1.0/libgstamrwbdec.so
    usr/lib/gstreamer-1.0/libgstasf.so
    usr/lib/gstreamer-1.0/libgstcdio.so
    usr/lib/gstreamer-1.0/libgstdvdlpcmdec.so
    usr/lib/gstreamer-1.0/libgstdvdread.so
    usr/lib/gstreamer-1.0/libgstdvdsub.so
    usr/lib/gstreamer-1.0/libgstmpeg2dec.so
    usr/lib/gstreamer-1.0/libgstrealmedia.so
    usr/lib/gstreamer-1.0/libgstsid.so
    usr/lib/gstreamer-1.0/libgstx264.so
    usr/lib/gstreamer-1.0/libgstxingmux.so

    usr/share/gstreamer-1.0/presets/Gst{Amrnb,X264}Enc.prs

    usr/share/locale/*/LC_MESSAGES/gst-plugins-ugly-1.0.mo
  ); _install
}

package_gst-libav-git() {
  pkgdesc+=" - libav plugin"
  depends=("gst-plugins-base-libs=$pkgver" bzip2 ffmpeg)
  provides=("gst-ffmpeg=$pkgver")
  conflicts=('gst-libav')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstlibav.so
  ); _install
}

package_gst-rtsp-server-git() {
  pkgdesc+=" - rtsp server"
  depends=("gst-plugins-base-libs=$pkgver")
  conflicts=('gst-rtsp-server')

  cd root; local files=(
    usr/include/gstreamer-1.0/gst/rtsp-server
    usr/lib/libgstrtspserver-1.0.so*
    usr/lib/pkgconfig/gstreamer-rtsp-server-1.0.pc
    usr/lib/girepository-1.0/GstRtspServer-1.0.typelib
    usr/share/gir-1.0/GstRtspServer-1.0.gir

    usr/lib/gstreamer-1.0/libgstrtspclientsink.so
  ); _install
}

package_gst-editing-services-git() {
  pkgdesc+=" - editing services"
  depends=("gst-plugins-base-libs=$pkgver" python-gobject)
  conflicts=('gst-editing-services')

  cd root; local files=(
    usr/include/gstreamer-1.0/ges
    usr/lib/libges-1.0.so*
    usr/lib/pkgconfig/gst-editing-services-1.0.pc
    usr/lib/girepository-1.0/GES-1.0.typelib
    usr/share/gir-1.0/GES-1.0.gir

    usr/lib/gstreamer-1.0/libgstges.so
    usr/lib/gstreamer-1.0/libgstnle.so

    usr/lib/python*/site-packages/gi/overrides/GES.py

    usr/bin/ges-launch-1.0
    usr/share/man/man1/ges-launch-1.0.1

    usr/share/bash-completion/completions/ges-launch-1.0
  ); _install

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

package_gstreamer-vaapi-git() {
  pkgdesc+=" - vaapi plugin"
  depends=("gst-plugins-base-libs-git=$pkgver" libva libxrandr)
  conflicts=('gst-vaapi')
  cd root; local files=(
  usr/include/gstreamer-1.0/gst/va/va-enumtypes.h
  usr/include/gstreamer-1.0/gst/va/gstva.h
  usr/include/gstreamer-1.0/gst/va/gstvaallocator.h
  usr/include/gstreamer-1.0/gst/va/gstvadisplay.h
  usr/include/gstreamer-1.0/gst/va/gstvadisplay_drm.h
  usr/include/gstreamer-1.0/gst/va/gstvadisplay_wrapped.h
  usr/include/gstreamer-1.0/gst/va/gstvapool.h
  usr/include/gstreamer-1.0/gst/va/gstvautils.h
  usr/include/gstreamer-1.0/gst/va/va-prelude.h
  usr/include/gstreamer-1.0/gst/va/va_fwd.h

  usr/lib/gstreamer-1.0/libgstvaapi.so
  usr/lib/girepository-1.0/GstVa-1.0.typelib

  usr/lib/gstreamer-1.0/pkgconfig/gstvaapi.pc
  usr/lib/pkgconfig/gstreamer-va-1.0.pc
  usr/share/gir-1.0/GstVa-1.0.gir

); _install
}

package_gst-python-git() {
  pkgdesc+=" - python plugin"
  depends=("gst-plugins-base-libs-git=$pkgver" python-gobject)
  conflicts=('gst-python')

  cd root; local files=(
    usr/lib/gstreamer-1.0/libgstpython.so
    usr/lib/python*/site-packages/gi/overrides
  ); _install

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

package_gst-devtools-git() {
  pkgdesc+=" - subset of devtools"
  depends=(python)
  conflicts=("gst-devtools")
  cd root; local files=(
  usr/lib/gst-validate-launcher/python/launcher/apps/geslaunch.py
  usr/share/gstreamer-1.0/validate/scenarios/ges-edit-clip-while-paused.scenario
); _install

}
package_gstreamer-docs-git() {
  pkgdesc+=" - documentation"
  conflicts=('gstream-docs')
  license=(GPL3 LGPL custom:BSD custom:CC-BY-SA-4.0 custom:MIT custom:OPL)

  # make sure there are no files left to install
  find root -depth -print0 | xargs -0 rmdir

  cd gstreamer-docs-${_pkgver%%+*}

  mkdir -p "$pkgdir/usr/share"
  cp -a devhelp "$pkgdir/usr/share/devhelp"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING LICENSE*
}
