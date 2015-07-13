_name=vlc
pkgname=vlc-clang-git
pkgver=3.0.r61465.g8239787
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player. Development GIT Version."
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')


depends=('a52dec' 'libdvbpsi' 'libxpm' 'qt5-base'
         'sdl_image' 'libdvdnav' 'lua' 'libmatroska'
         'libmpcdec' 'ffmpeg' 'faad2' 'libupnp'
         'libmad' 'libmpeg2' 'xcb-util-keysyms'
         'libxinerama'
         'x264' 'fluidsynth' 'x265-hg')
makedepends=('live-media' 'libbluray' 'flac' 'kdelibs4support'
             'libdc1394' 'libavc1394' 'lirc-utils'
             'librsvg' 'projectm'
             'twolame' 'aalib' 'libdvdcss'
             'vcdimager' 'opus' 'libssh2' 'mesa'
             'git')

optdepends=('ncurses: for ncurses interface support'
            'libdvdcss: for decoding encrypted DVDs'
            'lirc-utils: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'kdelibs: KDE Solid hardware integration'
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
install="${pkgname}.install"
source=('git://git.videolan.org/vlc.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "3.0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
}


prepare() {
  cd "${srcdir}/${_name}"
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${_name}"
  msg 'Generating necessary files...'
  ./bootstrap
  msg 'Done. Configuring VLC...'


  CC=clang CXX=clang++ ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --enable-faad \
              --enable-nls \
              --enable-lirc \
              --enable-ncurses \
              --enable-realrtsp \
              --enable-aa \
              --enable-vcdx \
              --enable-upnp \
              --enable-opus \
              --enable-sftp \
              --disable-atmo \
              --disable-bonjour \
              --disable-caca \
              --disable-coverage \
              --disable-cprof \
              --disable-dbus \
              --disable-dbus-control \
              --disable-dca \
              --disable-debug \
              --disable-decklink \
              --disable-dirac \
              --enable-directfb \
              --disable-directx \
              --disable-dshow \
              --disable-dv \
              --disable-fbosd \
              --disable-fribidi \
              --disable-gme \
              --disable-gnomevfs \
              --disable-gnutls \
              --disable-goom \
              --disable-gprof \
              --disable-growl \
              --disable-jack \
              --disable-kate \
              --disable-libcddb \
              --disable-libgcrypt \
              --disable-libproxy \
              --disable-libtar \
              --disable-linsys \
              --disable-live555 \
              --disable-loader \
              --disable-macosx \
              --disable-macosx-audio \
              --disable-mod \
              --disable-mtp \
              --disable-notify \
              --disable-opencv \
              --disable-oss \
              --disable-portaudio \
              --disable-postproc \
              --enable-pulse \
              --disable-pvr \
              --disable-quicktime \
              --disable-run-as-root \
              --disable-schroedinger \
              --disable-shine \
              --disable-shout \
              --disable-sid \
              --disable-skins2 \
              --disable-smb \
              --disable-sqlite \
              --disable-switcher \
              --disable-taglib \
              --disable-telepathy \
              --disable-telx \
              --disable-tiger \
              --disable-tremor \
              --disable-udev \
              --disable-update-check \
              --disable-visual \
              --disable-waveout \
              --disable-wingdi \
              --disable-xosd \
              --disable-zvbi \
							--disable-projectm \
              LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \
              RCC=/usr/bin/rcc-qt4

  msg 'Done. Starting make...'
  make
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install
}
