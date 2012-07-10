# $Id: PKGBUILD 163162 2012-07-08 09:32:43Z ibiru $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgname=vlc
pkgname=vlc-decklink
pkgver=2.0.2
pkgrel=2
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player (with decklink module)"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'qt' 'libproxy' 
         'sdl_image' 'libdvdnav' 'libtiger' 'lua' 'libmatroska' 
         'zvbi' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp' 
         'libshout' 'libmad' 'libmpeg2' 'libmodplug' 'libass' 
         'xcb-util-keysyms' 'ttf-freefont')
makedepends=('live-media' 'libnotify' 'libbluray' 'flac' 'kdelibs'
             'fluidsynth' 'libdc1394' 'libavc1394' 'lirc-utils'
             'libcaca' 'librsvg' 'portaudio' 'oss' 'libgme' 'xosd'
             'projectm' 'twolame' 'aalib' 'libmtp' 'libdvdcss'
             'gnome-vfs' 'libgoom2' 'libtar' 'vcdimager'
             'decklink-sdk')
optdepends=('avahi: for service discovery using bonjour protocol'
            'libnotify: for notification plugin'
            'ncurses: for ncurses interface support'
            'libdvdcss: for decoding encrypted DVDs'
            'lirc-utils: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'kdelibs: KDE Solid hardware integration'
            'vdpau-video: vdpau back-end for nvidia'
            'libva-driver-intel: back-end for intel cards'
            'libbluray: for Blu-Ray support'
            'flac: for Free Lossless Audio Codec plugin'
            'oss: for OSS audio support'
            'portaudio: for portaudio support'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'projectm: for ProjectM visualisation plugin'
            'libcaca: for colored ASCII art video output'
            'libgme: for libgme plugin'
            'librsvg: for SVG plugin'
            'gnome-vfs: for GNOME Virtual File System support'
            'libgoom2: for libgoom plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'xosd: for xosd support'
            'aalib: for ASCII art plugin'
            'libmtp: for MTP devices support'
            'fluidsynth: for synthesizer MIDI FluidSynth'
            'smbclient: for SMB access plugin'
            'libcdio: for audio CD playback support')
conflicts=('vlc-plugin' 'vlc')
provides=('vlc')
replaces=('vlc-plugin')
backup=('usr/share/vlc/lua/http/.hosts'
        'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!libtool' '!emptydirs')
install=vlc.install
source=("http://download.videolan.org/pub/videolan/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
md5sums=('93e729cc970a4535b3213dbef0e69528')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # dirty hack because of VLC's configure
  [ -d decklink-sdk ] || mkdir decklink-sdk
  ln -sf /usr/src/decklink-sdk decklink-sdk/include

  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c

  ./configure --prefix=/usr \
              --disable-rpath \
              --enable-oss \
              --enable-faad \
              --enable-nls \
              --enable-lirc \
              --enable-pvr \
              --enable-ncurses \
              --enable-realrtsp \
              --enable-xosd \
              --enable-aa \
              --enable-vcdx \
              --enable-decklink \
              --with-decklink-sdk="${srcdir}/${_pkgname}-${pkgver}/decklink-sdk"

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -D -m644 "${srcdir}/vlc-${pkgver}/share/icons/${res}x${res}/vlc.png" \
        "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
}
