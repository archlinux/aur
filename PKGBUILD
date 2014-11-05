# vim:set ft=sh:
# Maintainer: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
# Contributor: marzoul
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD

pkgname=kodi-git
_gitname='xbmc'
pkgver=20141104.15aac56
pkgrel=1
pkgdesc="media player and entertainment hub (master branch)"
provides=('xbmc')
conflicts=('xbmc' 'xbmc-pulse' 'xbmc-svn' 'xbmc-git')
replaces=('xbmc-svn' 'xbmc-git')
arch=('i686' 'x86_64')
url="http://xbmc.org"
license=('GPL2')
depends=(
'bluez-libs' 'curl' 'flac' 'glew' 'hicolor-icon-theme' 'lame' 'libaacs'
'libass' 'libbluray' 'libcdio' 'libmariadbclient' 'libmicrohttpd' 'libmodplug'
'libmpeg2' 'libpulse' 'libsamplerate' 'libssh' 'libva' 'libvdpau' 'libvorbis'
'libxrandr' 'libxslt' 'lzo' 'mesa' 'mesa-demos' 'python2-pillow'
'python2-simplejson' 'rtmpdump' 'sdl_image' 'smbclient' 'taglib' 'tinyxml'
'xorg-xdpyinfo' 'yajl'
)
makedepends=(
'afpfs-ng' 'boost' 'cmake' 'doxygen' 'git' 'gperf' 'jasper'
'java-runtime' 'libcec' 'libnfs' 'libplist' 'nasm' 'shairplay'
'swig' 'unzip' 'upower' 'zip'
)
optdepends=(
'gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED'
'afpfs-ng: Apple shares support'
'bluez: Blutooth support'
'libnfs: NFS shares support'
'libplist: AirPlay support'
'libcec: Pulse-Eight USB-CEC adapter support'
'lirc: Remote controller support'
'pulseaudio: PulseAudio support'
'shairplay: AirPlay support'
'udisks: Automount external drives'
'unrar: Archives support'
'unzip: Archives support'
'upower: Display battery level'
)
install="$pkgname.install"
source=(
	"$_gitname::git://github.com/xbmc/xbmc.git"
)
sha256sums=(
	'SKIP'
)

_prefix='/usr'

pkgver() {
	cd "$srcdir/$_gitname"
	# suggested by marzoul
	git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

prepare() {
	cd ${_gitname}

	find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
	sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
	sed 's/python/python2/' -i tools/Linux/kodi.sh.in
}

build() {
	cd ${_gitname}

	# Bootstrapping
	./bootstrap

	# Configuring XBMC
	export PYTHON_VERSION=2  # external python v2
	./configure --prefix=$_prefix --exec-prefix=$_prefix \
		--enable-debug \
		--disable-optimizations \
		--enable-gl \
		--enable-vaapi \
		--enable-vdpau \
		--enable-joystick \
		--enable-xrandr \
		--enable-rsxs \
		--enable-projectm \
		--enable-x11 \
		--enable-pulse \
		--enable-rtmp \
		--enable-samba \
		--enable-nfs \
		--enable-afpclient \
		--enable-airplay \
		--enable-airtunes \
		--enable-ffmpeg-libvorbis \
		--enable-dvdcss \
		--disable-hal \
		--enable-avahi \
		--enable-webserver \
		--enable-optical-drive \
		--enable-libbluray \
		--enable-texturepacker \
		--enable-udev \
		--enable-libusb \
		--enable-libcec \
		--enable-external-libraries \
		--with-lirc-device=/run/lirc/lircd

	# Now (finally) build
	make
}

package() {
	cd ${_gitname}
	# Running make install
	make DESTDIR="$pkgdir" install

	# Tools
	install -Dm755 $srcdir/$_gitname/tools/TexturePacker/TexturePacker \
		${pkgdir}${_prefix}/lib/kodi/

	# Licenses
	install -dm755 ${pkgdir}${_prefix}/share/licenses/${pkgname}
	for licensef in LICENSE.GPL copying.txt; do
		mv ${pkgdir}${_prefix}/share/doc/kodi/${licensef} \
			${pkgdir}${_prefix}/share/licenses/${pkgname}
	done
}
