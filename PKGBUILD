# Maintainer : Andrew Crerar <andrew (at) crerar (dot) io>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: heaven <aheaven87 at gmail dot com>
# Contributor: graysky <graysky at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: MacWolf <macwolf at archlinux dot de>

pkgname=vlc-git
pkgver=4.0.0.r1318.gd3f1e231a0
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player (GIT Version)"
arch=('x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL3')
depends=('a52dec' 'faad2' 'ffmpeg' 'libdca' 'libdvbpsi' 'libdvdnav' 'libmad'
         'libmatroska' 'libmpcdec' 'libmpeg2' 'libproxy' 'libshout' 'libtar'
         'libtiger' 'libupnp' 'libxinerama' 'libxpm' 'lua' 'sdl_image'
         'wayland-protocols' 'taglib' 'zvbi' 'libsecret' 'libarchive'
         'qt5-x11extras' 'schroedinger' 'qt5-svg')
makedepends=('aalib' 'flac' 'git' 'libavc1394' 'libbluray' 'libcaca' 'libdc1394'
             'libdvdcss' 'libgme' 'libgoom2' 'libmtp' 'libnotify' 'librsvg'
             'libssh2' 'lirc' 'live-media' 'opus' 'portaudio' 'projectm'
             'twolame' 'vcdimager' 'xosd' 'smbclient')
optdepends=('aalib: for ASCII art plugin'
            'atk-git: for libnotify plugin'
            'avahi: for service discovery using bonjour protocol'
            'flac: for Free Lossless Audio Codec plugin'
            'gst-plugins-base-libs: for libgst plugins'
            'gtk2: for libnotify plugin'
            'kdelibs: KDE Solid hardware integration'
            'libavc1394: for devices using the 1394ta AV/C'
            'libbluray: for Blu-Ray support'
            'libcaca: for colored ASCII art video output'
            'libcddb: for libcdda plugin'
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
            'lirc: for lirc plugin'
            'lua-socket: for http interface'
            'ncurses: for ncurses interface support'
            'opus: for opus support'
            'portaudio: for portaudio support'
            'projectm: for ProjectM visualisation plugin'
            'protobuf: for chromecast plugin'
            'smbclient: for SMB access plugin'
            'ttf-dejavu: for subtitle font'
            'ttf-freefont: for subtitle font'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'vcdimager: navigate VCD with libvcdinfo')
_name=vlc
conflicts=("$_name" 'vlc-dev' 'vlc-plugin' 'vlc-stable-git')
provides=("$_name=$pkgver")
options=(!emptydirs)
source=('git+https://github.com/videolan/vlc.git'
        'lua53_compat.patch'
        'update-vlc-plugin-cache.hook')
sha512sums=('SKIP'
            '33cda373aa1fb3ee19a78748e2687f2b93c8662c9fda62ecd122a2e649df8edaceb54dda3991bc38c80737945a143a9e65baa2743a483bb737bb94cd590dc25f'
            '2f1015af384559bf4868bb989c06a7d281a8e32afb175ef397dbf1671bae3540a3a6b073a74ed77ed82e79a81f964a5a58a98c2a3f1b5e5cd5e9ea60d58c737f')

pkgver() {
  cd "$srcdir/$_name"
  printf "%s.r%s.g%s" "$(grep 'AC_INIT' configure.ac | sed 's/[^0-9\.]*//g')" "$(git describe --tags --long | cut -d '-' -f 3)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_name"

  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
  patch -p1 -i "$srcdir"/lua53_compat.patch
}

build() {
  cd "$srcdir/$_name"

  ./bootstrap

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS+=" -std=gnu++98"
  export LUAC=/usr/bin/luac
  export LUA_LIBS="`pkg-config --libs lua`"
  export RCC=/usr/bin/rcc-qt5


  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --disable-rpath \
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
              --enable-wayland \
              --disable-opencv
  make
}

package() {
  cd "$srcdir/$_name"

  make DESTDIR="$pkgdir" install

  for res in 16 32 48 128; do
    install -D -m644 "$srcdir"/"$_name"/share/icons/"${res}"x"${res}"/vlc.png \
                     "$pkgdir"/usr/share/icons/hicolor/"${res}"x"${res}"/apps/vlc.png
  done

  install -Dm 644 "$srcdir"/update-vlc-plugin-cache.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
