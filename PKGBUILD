# $Id$
# Maintainer: Sebastian Weiland <sebastianweiland97@gmail.com>
# Original package: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_appname_=vlc
pkgname=${_appname_}-nightly
pkgver=3.0.0v20170203
_pkgver=3.0.0
_snapshot_=20170203
_snapver_=0245
_nightly_=${_snapshot_}-${_snapver_}
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player - nightly snapshot"
arch=("i686" "x86_64")
url="http://www.videolan.org/vlc/"
license=("LGPL2.1" "GPL2")
depends=("a52dec" "libdvbpsi" "libxpm" "libdca" "qt5-base" "libproxy"
         "sdl_image" "libdvdnav" "libtiger" "lua" "libmatroska"
         "zvbi" "taglib" "libmpcdec" "ffmpeg" "faad2" "libupnp"
         "libshout" "libmad" "directfb" "libmpeg2" "libmodplug" "libass"
         "xcb-util-keysyms" "libpthread-stubs")
makedepends=("live-media" "libnotify" "libbluray" "flac" "fluidsynth" "libdc1394" "libavc1394" "lirc-utils"
             "libcaca" "librsvg" "portaudio" "libgme" "xosd"
             "projectm" "twolame" "aalib" "libmtp" "libdvdcss"
             "gnome-vfs" "libgoom2" "libtar" "vcdimager" "opus" "libssh2"
             "mesa")
optdepends=("avahi: for service discovery using bonjour protocol"
            "libnotify: for notification plugin"
            "ncurses: for ncurses interface support"
            "libdvdcss: for decoding encrypted DVDs"
            "lirc-utils: for lirc plugin"
            "libavc1394: for devices using the 1394ta AV/C"
            "libdc1394: for IEEE 1394 plugin"
            "kdelibs: KDE Solid hardware integration"
            "libva-vdpau-driver: vdpau back-end for nvidia"
            "libva-intel-driver: back-end for intel cards"
            "libbluray: for Blu-Ray support"
            "flac: for Free Lossless Audio Codec plugin"
            "portaudio: for portaudio support"
            "twolame: for TwoLAME mpeg2 encoder plugin"
            "projectm: for ProjectM visualisation plugin"
            "libcaca: for colored ASCII art video output"
            "libgme: for libgme plugin"
            "librsvg: for SVG plugin"
            "gnome-vfs: for GNOME Virtual File System support"
            "libgoom2: for libgoom plugin"
            "vcdimager: navigate VCD with libvcdinfo"
            "xosd: for xosd support"
            "aalib: for ASCII art plugin"
            "libmtp: for MTP devices support"
            "fluidsynth: for synthesizer MIDI FluidSynth"
            "smbclient: for SMB access plugin"
            "libcdio: for audio CD playback support"
            "ttf-freefont: for subtitle font "
            "ttf-dejavu: for subtitle font"
            "opus: for opus support"
            "libssh2: for sftp support")
conflicts=("${_appname_}-plugin" "${_appname_}")
provides=("${_appname_}")
replaces=("${_appname_}-plugin")
#backup=("usr/share/${_appname_}/lua/http/.hosts"
#        "usr/share/${_appname_}/lua/http/dialogs/.hosts")
options=("!libtool" "!emptydirs" "debug")
source=("http://nightlies.videolan.org/build/source/vlc-${_pkgver}-${_nightly_}-git.tar.xz"  "update-vlc-plugin-cache.hook" "https://git.archlinux.org/svntogit/packages.git/plain/trunk/lua53_compat.patch?h=packages/vlc")

pkgver() {
 printf 3.0.0v$_snapshot_
} 

build() {
	cd "${_appname_}-3.0.0-git"
  RCC=/usr/bin/rcc-qt5
	./bootstrap
  patch -Np1 -i "${srcdir}/vlc"
	# Patch
	sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype/freetype.c
	# Config
	[ ${CARCH} = 'x86_64' ] && CXXFLAGS="$CXXFLAGS -fPIC"

	./configure --prefix=/usr \
				--sysconfdir=/etc \
        --enable-qt \
				--disable-rpath \
				--enable-faad \
				--enable-nls \
				--enable-lirc \
				--enable-pvr \
				--enable-ncurses \
				--enable-realrtsp \
				--enable-xosd \
				--enable-aa \
				--enable-vcdx \
				--enable-upnp \
				--enable-opus \
				--enable-sftp

	make -i
}

package() {
	cd "${_appname_}-3.0.0-git"

	make -i DESTDIR="${pkgdir}" install

	for res in 16 32 48 128; do
	install -D -m644 "${srcdir}/${_appname_}-3.0.0-git/share/icons/${res}x${res}/${_appname_}.png" \
		"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_appname_}.png"
	done

  install -Dm644 "$srcdir"/update-vlc-plugin-cache.hook "$pkgdir"/usr/share/libalpm/hooks/update-vlc-plugin-cache.hook
}

sha1sums=('e0453ed5de2263acba030315fb918805fbdbae94'
          'c3a35ba4dbd6c8e4e5b032664f50b9f0dcf579ee'
          '5d7dba23756ff577a90b8631b187fbeac1f94e17')
