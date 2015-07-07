# Maintainer : Andrew Crerar <andrew (dot) crerar at gmail>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: heaven <aheaven87 at gmail dot com>
# Contributor: graysky <graysky at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: MacWolf <macwolf at archlinux dot de>

_name=vlc
pkgname=vlc-git
pkgver=r2.2.0.git.3848.g31b18f0
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player (GIT Version)"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'faad2' 'ffmpeg' 'libdca' 'libdvbpsi'
         'libdvdnav' 'libmad' 'libmatroska' 'libmpcdec' 'libmpeg2'
         'libproxy' 'libshout' 'libtar' 'libtiger' 'libupnp'
         'libxinerama' 'libxpm' 'lua' 'qt4' 'sdl_image'
         'taglib' 'xcb-util-keysyms' 'zvbi')
makedepends=('aalib' 'flac' 'git' 'gnome-vfs' 'kdelibs'
             'libavc1394' 'libbluray' 'libcaca' 'libdc1394' 'libdvdcss'
             'libgme' 'libgoom2' 'libmtp' 'libnotify' 'librsvg'
             'libssh2' 'lirc-utils' 'live-media' 'mesa' 'opus'
             'portaudio' 'projectm' 'twolame' 'vcdimager' 'xosd')
optdepends=('aalib: for ASCII art plugin'
            'avahi: for service discovery using bonjour protocol'
            'flac: for Free Lossless Audio Codec plugin'
            'gnome-vfs: for GNOME Virtual File System support'
            'kdelibs: KDE Solid hardware integration'
            'libavc1394: for devices using the 1394ta AV/C'
            'libbluray: for Blu-Ray support'
            'libcaca: for colored ASCII art video output'
            'libcdio: for audio CD playback support'
            'libdc1394: for IEEE 1394 plugin'
            'libdvdcss: for decoding encrypted DVDs'
            'libgme: for libgme plugin'
            'libgoom2: for libgoom plugin'
            'libmtp: for MTP devices support'
            'libnotify: for notification plugin'
            'librsvg: for SVG plugin'
            'libssh2: for sftp support'
            'libva-intel-driver: back-end for intel cards'
            'libva-vdpau-driver: vdpau back-end for nvidia'
            'lirc-utils: for lirc plugin'
            'lua-socket: for http interface'
            'ncurses: for ncurses interface support'
            'opus: for opus support'
            'portaudio: for portaudio support'
            'projectm: for ProjectM visualisation plugin'
            'smbclient: for SMB access plugin'
            'ttf-dejavu: for subtitle font'
            'ttf-freefont: for subtitle font'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'vcdimager: navigate VCD with libvcdinfo')
conflicts=("${_name}" 'vlc-dev' 'vlc-plugin' 'vlc-stable-git')
provides=("${_name}=${pkgver}")
backup=('usr/share/vlc/lua/http/.hosts'
        'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!emptydirs')
install="${_name}.install"
source=('git://git.videolan.org/vlc.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_name}"

  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${_name}"

  ./bootstrap

  CFLAGS+=" -I/usr/include/samba-4.0" CPPFLAGS+=" -I/usr/include/samba-4.0" \
  ./configure --disable-rpath \
              --enable-aa \
              --enable-faad \
              --enable-lirc \
              --enable-ncurses \
              --enable-nls \
              --enable-opus \
              --enable-realrtsp \
              --enable-sftp \
              --enable-upnp \
              --enable-vcdx \
              --prefix=/usr \
              --sysconfdir=/etc \
              LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \
              RCC=/usr/bin/rcc-qt4

  make -j8
}

package() {
  cd "${srcdir}/${_name}"

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -D -m644 "${srcdir}/${_name}/share/icons/${res}x${res}/vlc.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
}
