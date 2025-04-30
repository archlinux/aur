# Maintainer:
# Contributor: Oliver Braunschweig <olt78 at web dot de>
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: heaven <aheaven87 at gmail dot com>
# Contributor: graysky <graysky at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: MacWolf <macwolf at archlinux dot de>

_pkgname="vlc"
pkgname="vlc-git"
pkgver=4.0.0.r33753.g562bc83
pkgrel=1
pkgdesc="Multi-platform MPEG, VCD/DVD, and DivX player"
url='https://code.videolan.org/videolan/vlc'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('i686' 'x86_64')

depends=(
  'aribb24'
  'chromaprint'
  'faad2'
  'ffmpeg'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gnutls'
  'harfbuzz'
  'libarchive'
  'libdvbpsi'
  'libebur128'
  'libidn'
  'libmad'
  'libmatroska'
  'libmpcdec'
  'libplacebo'
  'libsecret'
  'libupnp'
  'libxinerama'
  'libxml2'
  'libxpm'
  'lua'
  'qt6-base'
  'qt6-declarative'
  'rnnoise'
  'taglib'
  'xcb-util-keysyms'
)
makedepends=(
  'ffnvcodec-headers'
  'git'
  'qt6-shadertools'
  'vulkan-headers'
  'wayland-protocols'
)
optdepends=(
  'kwallet: kwallet keystore' # via D-Bus
  'libva-intel-driver: video backend intel'
  'libva-vdpau-driver: vdpau backend nvidia'
  'lua-socket: http interface'
)

_optdeps=(
  'aom: AOM AV1 codec'
  'aribb25: aribcam support'
  'avahi: service discovery using bonjour protocol'
  'dav1d: dav1d AV1 decoder'
  'flac: Free Lossless Audio Codec plugin'
  'fluidsynth: FluidSynth based MIDI playback plugin'
  'gst-plugins-base-libs: for libgst plugins'
  'gtk3: notification plugin'
  'jack: jack audio server'
  'kwindowsystem: kwin background blur effect'
  'libass: Subtitle support'
  'libavc1394: devices using the 1394ta AV/C'
  'libbluray: Blu-Ray video input'
  'libcaca: colored ASCII art video output'
  'libdc1394: IEEE 1394 access plugin'
  'libdvdnav: DVD with navigation input module'
  'libdvdread: DVD input module'
  'libgme: Game Music Emu plugin'
  'libgoom2: Goom visualization'
  'libjpeg-turbo: JPEG support'
  'libkate: Kate codec'
  'libmicrodns: mDNS services discovery (chromecast etc)'
  'libmodplug: MOD output plugin'
  'libmtp: MTP devices discovery'
  'libnfs: NFS access'
  'libnotify: notification plugin'
  'libogg: Ogg and OggSpots codec'
  'libpng: PNG support'
  'libpulse: PulseAudio audio output'
  'librsvg: SVG plugin'
  'libsamplerate: audio Resampler'
  'libshout: shoutcast/icecast output plugin'
  'libsoxr: SoX audio Resampler'
  'libssh2: sftp access'
  'libtheora: theora codec'
  'libtiger: Tiger rendering for Kate streams'
  'libvorbis: Vorbis decoder/encoder'
  'libvpx: VP8 and VP9 codec'
  'libxkbcommon: X11 XCB support'
  'lirc: lirc control'
  'live-media: streaming over RTSP'
  'mpg123: mpg123 codec'
  'opus: opus codec'
  'pcsclite: aribcam support'
  'projectm: ProjectM visualisation'
  'protobuf: chromecast streaming'
  'smbclient: SMB access plugin'
  'speex: Speex codec'
  'srt: SRT input/output plugin'
  'systemd-libs: udev services discovery'
  'twolame: TwoLAME mpeg2 encoder plugin'
  'zvbi: VBI/Teletext/webcam/v4l2 capture/decoding'
)

for i in "${_optdeps[@]}"; do
  makedepends+=("${i%%:*}")
  optdepends+=("$i")
done

provides=("${_pkgname}=${pkgver}" "lib${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "lib${_pkgname}")

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://code.videolan.org/videolan/vlc.git"
  'update-vlc-plugin-cache.hook'
)
sha256sums=(
  'SKIP'
  'b98043683dd90d3f5a3f501212dfc629839b661100de5ac79fd30cb7b4a06f13'
)

pkgver() {
  cd "$_pkgsrc"
  printf "%s.r%s.g%s" "$(grep 'AC_INIT' configure.ac | sed 's/[^0-9\.]*//g')" "$(git describe --tags --long | cut -d '-' -f 3)" "$(git rev-parse --short=7 HEAD)"
}

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

build() {
  export CFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/} -std=c++17"
  export MPG123_CFLAGS+=" -DMPG123_NO_LARGENAME"

  export RCC=/usr/lib/qt6/rcc
  export QMAKE=/usr/bin/qmake6
  export QTPATHS6="/usr/lib/qt6/bin/qtpaths6"

  # gawk -v RS="### config-options ###\n" 'NR==2{print}' PKGBUILD | sort -t'-' -k'4' | xclip -sel clip
  local _config_opts=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --with-kde-solid=/usr/share/solid/actions/

    ### config-options ###
    --enable-alsa
    --enable-aribb25
    --enable-aom
    --enable-archive
    --enable-aribsub
    --enable-avahi
    --enable-avcodec
    --enable-avformat
    --enable-bluray
    --enable-caca
    --enable-chromaprint
    --enable-chromecast
    --enable-dav1d
    --enable-dc1394
    --disable-decklink
    --enable-dv1394
    --enable-dvbpsi
    --enable-dvdnav
    --enable-dvdread
    --enable-ebur128
    --enable-faad
    --disable-fdkaac
    --enable-flac
    --disable-fluidsynth
    --enable-fontconfig
    --enable-freetype
    --enable-fribidi
    --enable-gme
    --enable-gnutls
    --enable-goom
    --enable-gst-decode
    --enable-harfbuzz
    --enable-jack
    --enable-jpeg
    --enable-kate
    --enable-kwallet
    --enable-libass
    --disable-libgcrypt
    --enable-libplacebo
    --enable-libva
    --enable-libxml2
    --enable-lirc
    --enable-live555
    --enable-mad
    --enable-matroska
    --enable-microdns
    --enable-mod
    --enable-mpc
    --enable-mpg123
    --enable-mtp
    --enable-ncurses
    --enable-nfs
    --enable-nls
    --enable-notify
    --enable-ogg
    --enable-oggspots
    --disable-opencv
    --enable-opus
    --enable-png
    --enable-postproc
    --enable-projectm
    --enable-pulse
    --enable-qt
    --enable-qtdeclarative
    --enable-qtshadertools
    --enable-qtsvg
    --enable-qtwayland
    --disable-rist
    --disable-rpath
    --enable-samplerate
    --disable-schroedinger
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
    --disable-update-check
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
    ### config-options ###
  )

  cd "$_pkgsrc"
  ./configure "${_config_opts[@]}"

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128 256; do
    install -Dm 644 "${srcdir}"/"${_pkgname}"/share/icons/"${res}"x"${res}"/vlc.png \
      "${pkgdir}"/usr/share/icons/hicolor/"${res}"x"${res}"/apps/vlc.png
  done

  install -Dm644 "${srcdir}"/update-vlc-plugin-cache.hook -t "${pkgdir}"/usr/share/libalpm/hooks
}
