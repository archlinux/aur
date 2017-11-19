_name=vlc
pkgname=vlc-clang-git
pkgver=3.0.0.r72962.g69409cf591
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player. Development GIT Version."
arch=('x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')


depends=('libfdk-aac' 'xosd' 'zvbi' 'a52dec' 'libdvbpsi' 'libxpm' 'qt5-base' 'qt5-svg' 'sndio'
         'sdl_image' 'libdvdnav' 'lua' 'libmatroska'
         'libmpcdec' 'ffmpeg' 'faad2' 'libupnp'
         'libmad' 'libmpeg2' 'xcb-util-keysyms'
         'libxinerama'
         'x264' 'fluidsynth' 'x265')
makedepends=('live-media' 'libbluray' 'flac' 'libdc1394' 'libavc1394' 'lirc-utils'
             'librsvg' 'projectm'
             'twolame' 'aalib' 'libdvdcss'
             'vcdimager' 'opus' 'libssh2' 'mesa'
             'git')

optdepends=('ncurses: for ncurses interface support'
            'libdvdcss: for decoding encrypted DVDs'
            'lirc-utils: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'libva-vdpau-driver: vdpau back-end for nvidia'
            'libva-intel-driver: back-end for intel cards'
            'libbluray: for Blu-Ray support'
            'flac: for Free Lossless Audio Codec plugin'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'projectm: for ProjectM visualisation plugin'
            'librsvg: for SVG plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'aalib: for ASCII art plugin'
            'libcdio: for audio CD playback support'
            'ttf-freefont: for subtitle font '
            'ttf-dejavu: for subtitle font'
            'opus: for opus support'
            'libssh2: for sftp support'
            'lua-socket: for http interface')

conflicts=("${_name}" 'vlc-stable-git' 'vlc-dev' 'vlc-plugin')
provides=("${_name}=${pkgver}")
backup=('usr/share/vlc/lua/http/.hosts'
        'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!emptydirs')
source=('git://git.videolan.org/vlc.git' 
         'update-vlc-plugin-cache.hook'
         'lua53_compat.patch::https://aur.archlinux.org/cgit/aur.git/plain/lua53_compat.patch?h=vlc-qt5')
sha256sums=('SKIP'
            'c6f60c50375ae688755557dbfc5bd4a90a8998f8cf4d356c10d872a1a0b44f3a'
            'd1cb88a1037120ea83ef75b2a13039a16825516b776d71597d0e2eae5df2d8fa')

pkgver() {
  cd "${srcdir}/${_name}"
  printf '3.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}


prepare() {
  cd "${srcdir}/${_name}"
  patch -p1 < "${srcdir}/lua53_compat.patch"
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype/freetype.c
}

build() {
  cd "${srcdir}/${_name}"
  msg 'Generating necessary files...'
  ./bootstrap
  msg 'Done. Configuring VLC...'

   export CFLAGS+=" -I/usr/include/samba-4.0" 
   export CPPFLAGS+=" -I/usr/include/samba-4.0" 
   export CXXFLAGS+=" -std=gnu++11" \
  export CC=clang 
   export CXX=clang++
   ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --enable-bluray \
              --enable-faad \
              --enable-wayland \
              --enable-archive \
              --enable-nls \
              --enable-sndio \
              --enable-libtar \
              --enable-lirc \
              --enable-ncurses \
              --enable-realrtsp \
              --enable-aa \
              --enable-upnp \
              --disable-matroska \
              --enable-gst-decode \
              --enable-opus \
              --enable-sftp \
              --disable-caca \
              --disable-coverage \
              --disable-cprof \
              --disable-gprof \
              --disable-dbus \
              --disable-dca \
              --disable-debug \
              --disable-decklink \
              --disable-directx \
              --disable-fribidi \
              --disable-gme \
              --disable-gnutls \
              --disable-goom \
              --disable-jack \
              --disable-kate \
              --disable-libcddb \
              --disable-libgcrypt \
              --disable-libtar \
              --disable-linsys \
              --disable-live555 \
              --disable-mod \
              --disable-mtp \
              --disable-notify \
              --disable-opencv \
              --disable-oss \
              --enable-postproc \
              --enable-pulse \
              --disable-run-as-root \
              --disable-schroedinger \
              --disable-shine \
              --disable-shout \
              --disable-sid \
              --enable-skins2 \
              --enable-taglib \
              --disable-telx \
              --disable-tiger \
              --disable-tremor \
              --disable-udev \
              --disable-update-check \
              --enable-zvbi \
              --enable-projectm \
              --enable-fdkaac \
              --enable-merge-ffmpeg \
              --enable-dvbpsi \
              LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \

  msg 'Done. Starting make...'
  ./compile
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -Dm 644 "${srcdir}/vlc/share/icons/${res}x${res}/vlc.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done

  install -Dm644 "$srcdir"/update-vlc-plugin-cache.hook "$pkgdir"/usr/share/libalpm/hooks/update-vlc-plugin-cache.hook
}
