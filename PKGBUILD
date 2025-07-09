# Maintainer: tytan652 <tytan652[at]tytanium[dot]xyz>

pkgbase=vlc-luajit
pkgname=(
  vlc-luajit
  libvlc-luajit
  vlc-plugin-luajit
)
_vlcver=3.0.21
# optional fixup version including hyphen
_vlcfixupver=
pkgver=${_vlcver}${_vlcfixupver//-/.r}
pkgrel=21
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player built with luajit for OBS Studio compatibility'
url='https://www.videolan.org/vlc/'
arch=('x86_64' 'aarch64')
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
)
# To manage dependency rebuild easily, this will prevent you to rebuild VLC on non-updated system
_abseilcppver=20250512.0
_aomver=3
_dav1dver=1.3.0
_ffmpegver=7
_flacver=1.5.0
_libdc1394ver=2.2.7
_libmicrodnsver=0.2
_libnfsver=6
_libtheoraver=1.2
_libupnpver=1.14
_libvpxver=1.14
_libxml2ver=2.14
_livemediaver=2025.05.24
_mpg123ver=1.32.2
_protobufver=31.1
_srtver=1.5
_taglibver=2
_x264ver=0.164
_x265ver=4.1
makedepends=(
  a52dec
  aalib
  "abseil-cpp>=$_abseilcppver"
  alsa-lib
  "aom>=$_aomver"
  aribb24
  aribb25
  avahi
  bash
  cairo
  dav1d
  dbus
  faad2
  "ffmpeg>=$_ffmpegver"
  "flac>=$_flacver"
  fluidsynth
  fontconfig
  freetype2
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnutls
  gst-plugins-base-libs
  gtk3
  harfbuzz
  hicolor-icon-theme
  jack
  libarchive
  libass
  libavc1394
  libbluray
  libcaca
  libdca
  "libdc1394>=$_libdc1394ver"
  libdvbpsi
  libdvdcss
  libdvdnav
  libdvdread
  libglvnd
  libgme
  libgoom2
  libjpeg-turbo
  libkate
  libmad
  libmatroska
  "libmicrodns>=$_libmicrodnsver"
  libmodplug
  libmpcdec
  libmpeg2
  libmtp
  libnotify
  "libnfs>=$_libnfsver"
  libogg
  libpng
  libproxy
  libpulse
  librsvg
  libsamplerate
  libsecret
  libshout
  libsoxr
  libssh2
  "libtheora>=$_libtheoraver"
  libtiger
  "libupnp>=$_libupnpver"
  # libva : Non-functional in VLC 3 if FFmpeg 5 or later, only VLC 4 supports it
  libvorbis
  "libvpx>=$_libvpxver"
  libx11
  libxcb
  libxinerama
  "libxml2>=$_libxml2ver"
  libxpm
  lirc
  "live-media>=$_livemediaver"
  lua
  mesa
  "mpg123>=$_mpg123ver"
  opus
  pcsclite
  projectm
  "protobuf>=$_protobufver"
  qt5-base
  qt5-svg
  qt5-x11extras
  sdl_image
  smbclient
  speex
  "srt>=$_srtver"
  systemd-libs
  "taglib>=$_taglibver"
  twolame
  vcdimager
  wayland
  wayland-protocols
  "x264>=$_x264ver"
  "x265>=$_x265ver"
  xcb-util-keysyms
  xosd
  zlib
  zvbi
  luajit
  lua51
  vlc
  libvlc libvlccore.so
)
_name=vlc
options=('!emptydirs')
source=(https://download.videolan.org/${_name}/${_vlcver}/${_name}-${_vlcver}${_vlcfixupver}.tar.xz
        'update-vlc-plugin-cache.hook'
        'taglib-2.patch'
        'libnfs6-mr-6527.patch'
        'add-ffmpeg7-support.patch') #https://code.videolan.org/videolan/vlc/-/merge_requests/5574
sha512sums=('cb1af76c8056648c331d7e6e0680d161ed1849eb635987504f45eae02531e9b432651034317fa7e02b0722905dfb9f0f5dad67b5924cc62edcaf0d173ac36aee'
            'b247510ffeadfd439a5dadd170c91900b6cdb05b5ca00d38b1a17c720ffe5a9f75a32e0cb1af5ebefdf1c23c5acc53513ed983a736e8fa30dd8fad237ef49dd3'
            'ea0d1e1dfed16dac8f9027eb55d987dee59630568b9744ceb42bfa134ea9295252d83574f3d793a76a5be3b02661c1731ed366003b6b55b2d7f02fde70586ff3'
            'ea13dd8a1815af183064590d25eb9e652e81bd2d481d311bc4f841c32977205d1d3663d1c3e1c2fe642d546b5e6ab38d5fa6e3ea77808f76d138052900c19032'
            'dc155f70ae6a800cea2fd8a9167c0fec0b67b695cbe5bf7bb7f1ca76247100ddb8493e7ce6a9ff5e35686d20b79408960a367156955fab892357bc1fb91e2bfe')

prepare() {
  cd ${_name}-${_vlcver}
  sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
  sed 's|whoami|echo builduser|g' -i configure
  sed 's|hostname -f|echo arch|g' -i configure
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # chromaprint: missing cast 
  # https://code.videolan.org/videolan/vlc/-/commit/770789f265761fc7ab2de69ca105fec4ad93d9e2
  sed 's/p_buf->p_buffer/(int16_t \*)p_buf->p_buffer/g' -i modules/stream_out/chromaprint.c

  # Fix to build against libcaca 0.99.beta20 (kept as comment)
  #sed -i 's/cucul_/caca_/g' modules/video_output/caca.c
  #sed -i 's/CUCUL_COLOR/CACA/g' modules/video_output/caca.c

  # live555: fix build with versions >= 2024.11.28
  sed -i 's/char             event_/EventLoopWatchVariable event_/g' -i modules/access/live555.cpp

  # opus_header: fix channel mapping family 1 parsing 
  sed -i 's/channel_mapping == 2/channel_mapping <= 2/g' -i modules/codec/opus_header.c

  autoreconf -vf
}

build() {
  cd ${_name}-${_vlcver}

  local configure_options=(
    --disable-chromaprint
    --disable-fdkaac
    --disable-libgcrypt
    --disable-libplacebo
    --disable-opencv
    --disable-rpath
    --disable-schroedinger
    --disable-update-check
    --enable-a52
    --enable-aa
    --enable-alsa
    --enable-aom
    --enable-archive
    --enable-aribsub
    --enable-aribcam
    --enable-avahi
    --enable-avcodec
    --enable-avformat
    --enable-bluray
    --enable-caca
    --enable-chromecast
    --enable-dav1d
    --enable-dc1394
    --enable-dca
    --enable-dv1394
    --enable-dvbpsi
    --enable-dvdnav
    --enable-dvdread
    --enable-faad
    --enable-flac
    --enable-fluidsynth
    --enable-fontconfig
    --enable-freetype
    --enable-fribidi
    --enable-gnutls
    --enable-gme
    --enable-goom
    --enable-gst-decode
    --enable-harfbuzz
    --enable-jack
    --enable-jpeg
    --enable-kate
    --enable-kwallet
    --enable-libass
    --enable-libmpeg2
    --disable-libva # Incompatible with FFmpeg 5+
    --enable-libxml2
    --enable-lirc
    --enable-live555
    --enable-mad
    --enable-matroska
    --enable-mod
    --enable-mpc
    --enable-mpg123
    --enable-microdns
    --enable-mtp
    --enable-ncurses
    --enable-nfs
    --enable-nls
    --enable-notify
    --enable-ogg
    --enable-oggspots
    --enable-opus
    --enable-png
    --enable-postproc
    --enable-projectm
    --enable-pulse
    --enable-qt
    --enable-realrtsp
    --enable-samplerate
    --enable-sdl-image
    --enable-secret
    --enable-sftp
    --enable-shout
    --enable-skins2
    --enable-smbclient
    --enable-soxr
    --enable-speex
    --enable-srt
    --enable-svg
    --enable-svgdec
    --enable-taglib
    --enable-tiger
    --enable-twolame
    --enable-upnp
    --enable-vdpau
    --enable-vlc
    --enable-vorbis
    --enable-vpx
    --enable-wayland
    --enable-x264
    --enable-x265
    --enable-zvbi
    --prefix=/usr
    --sysconfdir=/etc
    --with-kde-solid=/usr/share/solid/actions/
    --disable-decklink
    --enable-lua
  )

  if [[ $CARCH == 'aarch64' ]]; then
    configure_options+=(--enable-gles2)
  fi

  export CFLAGS+=' -Wno-error=incompatible-pointer-types'

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CXXFLAGS+=" -std=c++17"
  # OBS Studio use luajit which is a drop-in for lua5.1
  # So lets build VLC with luajit and luac5.1 rather than lua5.2 and luac5.2
  # Which will make OBS not crash when loading a VLC (Video) Source
  export LUAC=/usr/bin/luac5.1
  export LUA_LIBS="$(pkg-config --libs luajit)"
  export LUA_CFLAGS="$(pkg-config --cflags luajit)"
  export RCC=/usr/bin/rcc-qt5

  ./configure "${configure_options[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_vlc-luajit() {
  depends=(
    vlc
    libvlc-luajit
    vlc-plugin-luajit
  )
  arch=(any)

  cd $_name-$_vlcver

  make DESTDIR="$pkgdir" install

  (
    cd "$pkgdir"

    _pick $_name-plugin-luajit usr/lib/vlc/lua/
    _pick $_name-plugin-luajit usr/lib/vlc/plugins/lua/
    _pick $_name-plugin-luajit usr/share/vlc/lua/
    _pick $_name-plugin-luajit usr/share/doc/vlc/lua/
  )

  rm -rf $pkgdir/*
}

package_libvlc-luajit() {
  pkgdesc+=" - library meta-package"
  depends=(
    libvlc
  )
  arch=(any)
}

package_vlc-plugin-luajit() {
  pkgdesc+=" - LuaJIT scripting plugins"
  depends=(
    gcc-libs
    glibc
    libvlc libvlccore.so
    luajit
  )
  optdepends=(
    'lua-socket: for http interface'
  )
  conflicts=(vlc-plugin-lua)
  provides=("vlc-plugin-lua=$pkgver")

  mv -v $pkgname/* "$pkgdir"
}
