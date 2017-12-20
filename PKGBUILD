# $Id$
# Maintainer: Sebastian Weiland <sebastianweiland97@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
# Original package: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_appname_=vlc
pkgname=${_appname_}-nightly
pkgver=4.0.0v20171220
_pkgver=4.0.0
_snapshot_=20171220
_snapver_=0237
_suffix_=dev
_nightly_=${_snapshot_}-${_snapver_}
pkgrel=1
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player - nightly snapshot'
url='https://www.videolan.org/vlc/'
arch=('x86_64')
license=('LGPL2.1' 'GPL2')
_undetected_depends=()
depends=('libmatroska' 'a52dec' 'sidplay2-libs' 'libfdk-aac' 'faad2' 'ffmpeg' 'libdca' 'daala-git' 'libdvbpsi'
         'libdvdnav' 'libmad' 'libmpcdec' 'libmpeg2'
         'libproxy' 'libshout' 'libtar' 'libtiger' 'libupnp'
         'libxinerama' 'libxpm' 'lua' 'sdl_image' 'mesa' 'sndio' 'wayland' 'wayland-protocols'
         'taglib' 'xcb-util-keysyms' 'zvbi' 'libsecret' 'libarchive' 'qt5-base' 'qt5-svg' 'libglvnd'
         'hicolor-icon-theme' 'qt5-x11extras' "${_detected_depends[@]}")
makedepends=('aalib' 'flac' 'git'
             'libavc1394' 'libbluray' 'libcaca' 'libdc1394' 'libdvdcss'
             'libgme' 'libgoom2' 'libmtp' 'libnotify' 'librsvg'
             'libssh2' 'lirc' 'live-media'  'opus'
             'portaudio' 'projectm' 'twolame' 'vcdimager' 'smbclient')
optdepends=('aalib: for ASCII art plugin'
            'avahi: for service discovery using bonjour protocol'
            'flac: for Free Lossless Audio Codec plugin'
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
            'lirc: for lirc plugin'
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
conflicts=("${_appname_}-plugin" "${_appname_}")
provides=("${_appname_}")
replaces=("${_appname_}-plugin")
options=('!emptydirs')
source=("http://nightlies.videolan.org/build/source/vlc-${_pkgver}-${_nightly_}-${_suffix_}.tar.xz"
        'update-vlc-plugin-cache.hook'
        'https://git.archlinux.org/svntogit/packages.git/plain/trunk/lua53_compat.patch?h=packages/vlc'
        'find-deps.py')

pkgver() {
 printf ${_pkgver}v$_snapshot_
} 

prepare() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  ./bootstrap

  patch -Np1 -i "${srcdir}/vlc"
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype/freetype.c
}

build() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0" 
  export CXXFLAGS+=" -std=gnu++11"
  export LUAC=/usr/bin/luac
  export LUA_LIBS="`pkg-config --libs lua`"
  export RCC=/usr/bin/rcc-qt5

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-rpath \
    --enable-faad \
    --enable-nls \
    --enable-lirc \
    --enable-ncurses \
    --enable-realrtsp \
    --enable-aa \
    --enable-upnp \
    --enable-opus \
    --enable-sftp \
    --enable-fdkaac \
    --enable-archive \
    --enable-bluray \
    --enable-daala

  ./compile
}

package() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  make -i DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -D -m644 "${srcdir}/${_appname_}-${_pkgver}-${_suffix_}/share/icons/${res}x${res}/${_appname_}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_appname_}.png"
  done

  install -Dm644 "$srcdir"/update-vlc-plugin-cache.hook "$pkgdir"/usr/share/libalpm/hooks/update-vlc-plugin-cache.hook

  # Update dependencies automatically based on dynamic libraries
  # _detected_depends=($(find "$pkgdir"/usr -name "*.so" | xargs python "$srcdir"/find-deps.py))

  #  msg 'Auto-detected dependencies:'
  #  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  #  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}

sha256sums=('e26c1b92ca11f370e8e38c9ad379f598d9249717a61807ca0c465ff187bfb0f9'
            'c6f60c50375ae688755557dbfc5bd4a90a8998f8cf4d356c10d872a1a0b44f3a'
            'd1cb88a1037120ea83ef75b2a13039a16825516b776d71597d0e2eae5df2d8fa'
            '90b0e34d5772d2307ba07a1c2aa715db7488389003cfe6d3570b2a9c63061db7')
