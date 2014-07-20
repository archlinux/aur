# $Id: PKGBUILD 216742 2014-07-09 13:17:31Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgname=vlc
pkgname=vlc-decklink
pkgver=2.1.5
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player (with decklink module)"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'qt4' 'libproxy'
         'sdl_image' 'libdvdnav' 'libtiger' 'lua' 'libmatroska'
         'zvbi' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp'
         'libshout' 'libmad' 'libmpeg2' 'xcb-util-keysyms' 'libtar'
         'libxinerama')
makedepends=('live-media' 'libnotify' 'libbluray' 'flac' 'kdelibs'
             'libdc1394' 'libavc1394' 'lirc-utils' 'libcaca'
             'librsvg' 'portaudio' 'libgme' 'xosd' 'projectm'
             'twolame' 'aalib' 'libmtp' 'libdvdcss' 'gnome-vfs'
             'libgoom2' 'vcdimager' 'opus' 'libssh2' 'mesa'
			 'decklink-sdk')
optdepends=('avahi: for service discovery using bonjour protocol'
            'libnotify: for notification plugin'
            'ncurses: for ncurses interface support'
            'libdvdcss: for decoding encrypted DVDs'
            'lirc-utils: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'kdelibs: KDE Solid hardware integration'
            'libva-vdpau-driver: vdpau back-end for nvidia'
            'libva-intel-driver: back-end for intel cards'
            'libbluray: for Blu-Ray support'
            'flac: for Free Lossless Audio Codec plugin'
            'portaudio: for portaudio support'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'projectm: for ProjectM visualisation plugin'
            'libcaca: for colored ASCII art video output'
            'libgme: for libgme plugin'
            'librsvg: for SVG plugin'
            'gnome-vfs: for GNOME Virtual File System support'
            'libgoom2: for libgoom plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'aalib: for ASCII art plugin'
            'libmtp: for MTP devices support'
            'smbclient: for SMB access plugin'
            'libcdio: for audio CD playback support'
            'ttf-freefont: for subtitle font '
            'ttf-dejavu: for subtitle font'
            'opus: for opus support'
            'libssh2: for sftp support'
            'lua-socket: for http interface'
            'decklink: for decklink support')
conflicts=('vlc-plugin' 'vlc')
provides=('vlc')
replaces=('vlc-plugin')
backup=('usr/share/vlc/lua/http/.hosts'
        'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!emptydirs')
install=vlc.install
source=("http://download.videolan.org/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        'vlc-2.0.7-vaapi-compat.patch')
md5sums=('3941b561f590cc95ca5e795213cba2f2'
         '6df10774bb7acf20e09d6139e5c7839e')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/vlc-2.0.7-vaapi-compat.patch"

  # dirty hack because of VLC's configure
  [ -d decklink-sdk ] || mkdir decklink-sdk
  ln -sf /usr/src/decklink-sdk decklink-sdk/include

  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  CFLAGS+=" -I/usr/include/samba-4.0" CPPFLAGS+=" -I/usr/include/samba-4.0" \
  ./configure --prefix=/usr \
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
              --enable-decklink \
              --with-decklink-sdk="${srcdir}/${_pkgname}-${pkgver}/decklink-sdk" \
              LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \
              RCC=/usr/bin/rcc-qt4

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
