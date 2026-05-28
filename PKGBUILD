# Maintainer: tytan652 <tytan652[at]tytanium[dot]xyz>

pkgbase=vlc-luajit
pkgname=(
  vlc-luajit
  libvlc-luajit
  vlc-plugin-luajit
)
# optional fixup version including hyphen
pkgver=3.0.23_2
pkgrel=1
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
  ffmpeg
  flac
  fluidsynth
  fontconfig
  freetype2
  fribidi
  gdk-pixbuf2
  git
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
  libgcc
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
  libstdc++
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
  vlc
  libvlc libvlccore.so
)
_name=vlc
# This package only provides a replacement for the lua plugin.
# Not stripping the symbols from it and then avoid generating debug package is a better approach
options=(!emptydirs !strip)
source=(
  "git+https://code.videolan.org/videolan/vlc.git#tag=${pkgver//_/-}"
  0001-Use-reproducible-data-for-build-user-and-host.patch
  0002-Adjust-hardcoded-font-paths-for-ttf-dejavu.patch
  0003-Adjust-includes-for-build-with-gstreamer-1.28.patch
)
sha512sums=('7a8700de9b8c458474c6d43df5306f2d59ead93a665d64ebf7d4d0b38b378abc18e065c47fa04f85ff1ea51b3aff59bf6a6d6ac346991c4cf0ad78a3d9169150'
            '9d72267ac97c998a12435041ed9ff6010f422d21505b8074ebb54bc6c8ee56532e0706489415fa725c541a5271f36db1614c11ec3c82dd354c36af97c82972ad'
            'f5452e7fdbaa273f088e3accaea46687ff7dd8479a89e266987208aff8ddae2a0bb87bd0a602508d1a7f7d7fc9447e9c69eb0e3f84de9643d6213757e9a7cfb5'
            '232f5595356a9864f89caf36f7ff3d81ba58b9f76b2a39c5540837b705e21a7a8c6ae2980303d6ba8bc589f4664db2fe25956b1d7f8f420c4b216f354866715c')

prepare() {
  cd $_name

  # Replace luac with luajit, credits to LG for the fix
  sed 's|\$(luac_verbose)\$(LUAC) -o \$@ \$<|\$(luac_verbose)\$(LUAC) -b $< $@|g' -i share/Makefile.am

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --disable-chromaprint
    --disable-fdkaac
    --disable-kwallet
    --disable-libgcrypt
    --disable-libplacebo
    --disable-opencv
    --disable-rpath
    --disable-schroedinger
    --disable-sndio
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

  cd $_name

  # OBS Studio use luajit which is a drop-in for lua5.1
  # So lets build VLC with luajit rather than lua5.2 and luac5.2
  # Which will make OBS not crash when loading a VLC (Video) Source
  export LUAC=/usr/bin/luajit
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

  cd $_name

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
    libgcc
    libstdc++
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
