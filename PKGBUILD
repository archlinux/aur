# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgbase=vlc
pkgname=vlc-nox
pkgver=3.0.0
pkgrel=1
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player (without X support)'
url='https://www.videolan.org/vlc/'
arch=('x86_64')
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'libproxy' 'sdl_image' 'libdvdnav'
         'libtiger' 'lua' 'libmatroska' 'zvbi' 'taglib' 'libmpcdec' 'ffmpeg'
         'faad2' 'libupnp' 'libshout' 'libmad' 'libmpeg2' 'xcb-util-keysyms'
         'libtar' 'libxinerama' 'libsecret' 'libarchive')
makedepends=('live-media' 'libnotify' 'libbluray' 'flac' 'libdc1394'
             'libavc1394' 'lirc' 'libcaca' 'librsvg' 'portaudio'
             'libgme' 'xosd' 'projectm' 'twolame' 'aalib' 'libmtp' 'libdvdcss'
             'libgoom2' 'vcdimager' 'opus' 'libssh2' 'mesa' 'protobuf'
             'libnfs' 'mpg123' 'schroedinger')
optdepends=('avahi: service discovery using bonjour protocol'
            'libnotify: notification plugin'
            'ncurses: ncurses interface support'
            'libdvdcss: decoding encrypted DVDs'
            'lirc: lirc control plugin'
            'libavc1394: devices using the 1394ta AV/C'
            'libdc1394: IEEE 1394 access plugin'
            'libva-vdpau-driver: vdpau backend nvidia'
            'libva-intel-driver: backend intel cards'
            'libbluray: Blu-Ray video support'
            'flac: Free Lossless Audio Codec plugin'
            'portaudio: portaudio support'
            'twolame: TwoLAME mpeg2 encoder plugin'
            'projectm: ProjectM visualisation plugin'
            'libcaca: colored ASCII art video output'
            'libgme: libgme plugin'
            'librsvg: SVG plugin'
            'libgoom2: libgoom plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'aalib: ASCII art plugin'
            'libmtp: MTP devices support'
            'smbclient: SMB access plugin'
            'libcdio: audio CD playback support'
            'ttf-freefont: subtitle font '
            'ttf-dejavu: subtitle font'
            'opus: opus codec support'
            'libssh2: sftp access support'
            'libnfs: NFS access support'
            'mpg123: mpg123 codec support'
            'schroedinger: schroedinger codec support'
            'protobuf: chromecast support'
            'lua-socket: for http interface')
conflicts=('vlc' 'vlc-plugin' 'vlc-git')
replaces=('vlc' 'vlc-plugin' 'vlc-git')
options=('!emptydirs')
source=(http://download.videolan.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        update-vlc-plugin-cache.hook
        lua53_compat.patch)
sha512sums=('9bdc64e16ddd2e8d2693179f2fcac8462d7defff186262a049ba325ef00882fbd75a9d323b506ba06876a8168fd5e90319837c8dcd136b206161e67748c2a9f7'
            '80357bae69e32b353d3784932d854e294906798e14faffb87c3383c3b6f6bdc57cbabb9c6e3f3c1adf0f8ddbb24153e72104c963cf1934970c2983c96daef9df'
            '33cda373aa1fb3ee19a78748e2687f2b93c8662c9fda62ecd122a2e649df8edaceb54dda3991bc38c80737945a143a9e65baa2743a483bb737bb94cd590dc25f')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
  sed -e 's|-Werror-implicit-function-declaration||g' -i configure
  patch -Np1 < "${srcdir}/lua53_compat.patch"
  sed 's|whoami|echo builduser|g' -i configure
  sed 's|hostname -f|echo arch|g' -i configure
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS+=" -std=c++11"
  export LUAC=/usr/bin/luac
  export LUA_LIBS="$(pkg-config --libs lua)"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-qt \
              --disable-wayland \
              --disable-rpath \
              --enable-faad \
              --enable-nls \
              --enable-lirc \
              --enable-ncurses \
              --enable-realrtsp \
              --enable-aa \
              --enable-upnp \
              --enable-opus \
              --enable-sftp
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -Dm 644 "${srcdir}/vlc-${pkgver}/share/icons/${res}x${res}/vlc.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
  install -Dm 644 "${srcdir}/update-vlc-plugin-cache.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
}

# vim: ts=2 sw=2 et:
