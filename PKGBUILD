# Maintainer:

_pkgname="vlc-plugin-luajit"
pkgname="$_pkgname-git"
pkgver=4.0.0.r34284.gf4f3baf
pkgrel=1
pkgdesc="Multi-platform MPEG, VCD/DVD, and DivX player"
url="https://github.com/videolan/vlc"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('x86_64')

makedepends=(
  'git'
  'lua51'
  'luajit'
  'meson'
)

options=('!emptydirs' '!lto')

_pkgsrc="vlc.github"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  ./bootstrap
  autoreconf -vf

  sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
  sed -e 's|-Werror-implicit-function-declaration||g' \
    -e 's|whoami|echo builduser|g' \
    -e 's|hostname -f|echo arch|g' \
    -i configure
}

pkgver() {
  cd "$_pkgsrc"
  printf "%s.r%s.g%s" "$(grep 'AC_INIT' configure.ac | sed 's/[^0-9\.]*//g')" "$(git describe --tags --long | cut -d '-' -f 3)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/} -std=c++17"

  export LUAC=/usr/bin/luac5.1
  export LUA_LIBS="$(pkg-config --libs luajit)"
  export LUA_CFLAGS="$(pkg-config --cflags luajit)"

  export RCC=/usr/lib/qt6/rcc
  export QMAKE=/usr/bin/qmake6
  export QTPATHS6="/usr/lib/qt6/bin/qtpaths6"

  # gawk -v RS="### config-options ###\n" 'NR==2{print}' PKGBUILD | sort -t'-' -k'4' | xclip -sel clip
  local _config_opts=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --with-kde-solid=/usr/share/solid/actions/
    --with-gnu-ld

    --disable-rpath
    --disable-sse
    --disable-avx

    --enable-lua

    ### config-options ###
    --disable-alsa
    --disable-amf-enhancer
    --disable-amf-frc
    --disable-amf-scaler
    --disable-aom
    --disable-archive
    --disable-aribb25
    --disable-aribcaption
    --disable-aribsub
    --disable-asdcp
    --disable-avahi
    --disable-avcodec
    --disable-avformat
    --disable-bluray
    --disable-bpg
    --disable-caca
    --disable-chromaprint
    --disable-chromecast
    --disable-css
    --disable-d3d11va
    --disable-daala
    --disable-dav1d
    --disable-davs2
    --disable-dc1394
    --disable-decklink
    --disable-directx
    --disable-dsm
    --disable-dv1394
    --disable-dvbcsa
    --disable-dvbpsi
    --disable-dvdnav
    --disable-dvdread
    --disable-dxva2
    --disable-ebur128
    --disable-egl
    --disable-faad
    --disable-fdkaac
    --disable-flac
    --disable-fluidlite
    --disable-fluidsynth
    --disable-fontconfig
    --disable-freerdp
    --disable-freetype
    --disable-fribidi
    --disable-gbm
    --disable-gles2
    --disable-gme
    --disable-gnutls
    --disable-goom
    --disable-gst-decode
    --disable-harfbuzz
    --disable-jack
    --disable-jpeg
    --disable-kai
    --disable-kate
    --disable-kva
    --disable-kwallet
    --disable-libass
    --disable-libcddb
    --disable-libdrm
    --disable-libgcrypt
    --disable-libplacebo
    --disable-libva
    --disable-libxml2
    --disable-linsys
    --disable-lirc
    --disable-live555
    --disable-macosx
    --disable-macosx-avfoundation
    --disable-macosx-ui-shaders
    --disable-mad
    --disable-matroska
    --disable-medialibrary
    --disable-merge-ffmpeg
    --disable-microdns
    --disable-minimal-macosx
    --disable-mmal
    --disable-mod
    --disable-mpc
    --disable-mpg123
    --disable-mtp
    --disable-ncurses
    --disable-nfs
    --disable-notify
    --disable-nvdec
    --disable-ogg
    --disable-oggspots
    --disable-omxil
    --disable-opencv
    --disable-opensles
    --disable-opus
    --disable-oss
    --disable-osx-notifications
    --disable-pipewire
    --disable-png
    --disable-postproc
    --disable-projectm
    --disable-pulse
    --disable-qt
    --disable-qt-qml-cache
    --disable-qt-qml-debug
    --disable-rav1e
    --disable-rist
    --disable-rnnoise
    --disable-rpi-omxil
    --disable-samplerate
    --disable-schroedinger
    --disable-screen
    --disable-secret
    --disable-sftp
    --disable-shine
    --disable-shout
    --disable-sid
    --disable-skins2
    --disable-smb2
    --disable-smbclient
    --disable-sndio
    --disable-soxr
    --disable-sparkle
    --disable-spatialaudio
    --disable-speex
    --disable-srt
    --disable-svg
    --disable-svgdec
    --disable-swscale
    --disable-taglib
    --disable-telx
    --disable-theora
    --disable-tiger
    --disable-tremor
    --disable-twolame
    --disable-udev
    --disable-update-check
    --disable-upnp
    --disable-v4l2
    --disable-vcd
    --disable-vdpau
    --disable-vlc
    --disable-vnc
    --disable-vorbis
    --disable-vpl
    --disable-vpx
    --disable-vsxu
    --disable-vulkan
    --disable-wasapi
    --disable-wayland
    --disable-x262
    --disable-x264
    --disable-x26410b
    --disable-x265
    --disable-xcb
    --disable-zvbi
    ### config-options ###
  )

  cd "$_pkgsrc"
  ./configure "${_config_opts[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  mkdir -p "$srcdir/fakeinstall"
  make DESTDIR="$srcdir/fakeinstall" install
}

package() {
  pkgdesc+=" - Lua scripting plugins (LuaJIT)"

  depends=(
    libvlc libvlccore.so
    luajit
  )
  optdepends=(
    'lua-socket: for http interface'
  )

  provides=(
    'vlc-luajit'
    'vlc-plugin-lua'
  )
  conflicts=(
    'vlc-luajit'
    'vlc-plugin-lua'
  )

  local _filelist=(
    usr/lib/vlc/lua
    usr/lib/vlc/plugins/lua
    usr/share/doc/vlc/lua
    usr/share/vlc/lua
  )

  local i
  for i in "${_filelist[@]}"; do
    mkdir -p "$pkgdir/$i"
    mv "fakeinstall/$i"/* "$pkgdir/$i/"
  done
}
