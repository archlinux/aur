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
pkgver=$_vlcver${_vlcfixupver//-/.r}
pkgrel=22
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player built with luajit for OBS Studio compatibility'
url=https://www.videolan.org/vlc/
arch=('x86_64' 'aarch64')
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
makedepends=(
  a52dec
  aalib
  abseil-cpp
  alsa-lib
  aom
  aribb24
  aribb25
  avahi
  bash
  cairo
  dav1d
  dbus
  faad2
  ffmpeg4.4  # NOTE: switch to ffmpeg4.4, as ffmpeg >= 5 requires extensive changes disabling VAAPI (only supported with vlc >= 4)
  flac
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
  libcddb
  libdca
  libdc1394
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
  libmicrodns
  libmodplug
  libmpcdec
  libmpeg2
  libmtp
  libnotify
  libnfs
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
  libtheora
  libtiger
  libupnp
  libva
  libvorbis
  libvpx
  libx11
  libxcb
  libxinerama
  libxml2
  libxpm
  lirc
  live-media
  lua
  mesa
  mpg123
  opus
  pcsclite
  projectm
  protobuf
  qt5-base
  qt5-svg
  qt5-x11extras
  sdl12-compat
  sdl_image
  smbclient
  speex
  speexdsp
  srt
  systemd-libs
  taglib
  twolame
  wayland
  wayland-protocols
  x264
  x265
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
# This package only provides a replacement for the lua plugin.
# Not stripping the symbols from it and then avoid generating debug package is a better approach
options=(!emptydirs !strip)
source=(
  https://download.videolan.org/${_name}/${_vlcver}/${_name}-${_vlcver}${_vlcfixupver}.tar.xz
  taglib-2.patch
  libnfs6-mr-6527.patch
  https://github.com/videolan/vlc/commit/8befcbfa.patch # Fix build with recent live-media
  $_name-3.0.21-fix-opus-crash.patch::https://code.videolan.org/videolan/vlc/-/commit/a761e1c202b632e7865d18fcf11a2b9e285ea9ae.patch  # Fix crash with opus: https://gitlab.archlinux.org/archlinux/packaging/packages/vlc/-/issues/9
)
sha512sums=('cb1af76c8056648c331d7e6e0680d161ed1849eb635987504f45eae02531e9b432651034317fa7e02b0722905dfb9f0f5dad67b5924cc62edcaf0d173ac36aee'
            'ea0d1e1dfed16dac8f9027eb55d987dee59630568b9744ceb42bfa134ea9295252d83574f3d793a76a5be3b02661c1731ed366003b6b55b2d7f02fde70586ff3'
            'ea13dd8a1815af183064590d25eb9e652e81bd2d481d311bc4f841c32977205d1d3663d1c3e1c2fe642d546b5e6ab38d5fa6e3ea77808f76d138052900c19032'
            'eae772959f3f48f6a8e0ccb27711cc3ce59314db49ad38ecb4e03f52782e6acabd1d5ab21a2a5c1b702d7e35218c305d2e8f3082c84000bd6d1c0e136d33178e'
            '050196963f410a8d4e8a9977023c033ab54a6ada833374af07f2e8c332b5064ef837dba73185c31afad0c2362170656a0e8ac47ca5bf19751b75bb2437ff8ea6')

prepare() {
  cd $_name-$_vlcver
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
  autoreconf -vf
}

build() {
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
    --enable-libcddb
    --enable-libmpeg2
    --enable-libva
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
    --enable-vcd
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

  cd $_name-$_vlcver

  export CFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects -Wno-incompatible-pointer-types"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS+=" -std=c++17"
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig"
  # OBS Studio use luajit which is a drop-in for lua5.1
  # So lets build VLC with luajit and luac5.1 rather than lua5.2 and luac5.2
  # Which will make OBS not crash when loading a VLC (Video) Source
  export LUAC=/usr/bin/luac5.1
  export LUA_LIBS="$(pkg-config --libs luajit)"
  export LUA_CFLAGS="$(pkg-config --cflags luajit)"
  export RCC=/usr/bin/rcc-qt5
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig/:$PKG_CONFIG_PATH"

  # Ensure that ffmpeg4.4 is used with libtool when ffmpeg is installed
  export CFLAGS+=" -I/usr/include/ffmpeg4.4 -L/usr/lib/ffmpeg4.4"
  export CPPFLAGS+=" -I/usr/include/ffmpeg4.4 -L/usr/lib/ffmpeg4.4"

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
