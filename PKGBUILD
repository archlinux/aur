# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mpd-light-pulse-ffmpeg
pkgver=0.22.11
_majorver=0.22
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without openal, ao, jack, modplug, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, zziplib and gme support.'
url='https://www.musicpd.org/'
license=('GPL2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('alsa-lib' 'flac' 'libogg' 'ffmpeg' 'libpulse' 'libcdio-paranoia' 'audiofile' 'libmad' 'curl' 'faad2' 'sqlite'
         'libmms' 'libid3tag' 'libmpdclient' 'icu' 'libupnp' 'libvorbis'
         'libnfs' 'libsamplerate' 'libsoxr' 'liburing')
# So files
#depends+=('libFLAC.so' 'libasound.so' 'libaudiofile.so' 'libcurl.so'
#          'libfaad.so' 'libicui18n.so' 'libicuuc.so' 'libid3tag.so'
#          'libmpdclient.so' 'libogg.so' 'libsamplerate.so'
#          'libvorbis.so' 'libupnp.so' 'liburing.so' 'libixml.so')
makedepends=('boost' 'meson' 'python-sphinx')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
source=("https://www.musicpd.org/download/mpd/${_majorver}/mpd-${pkgver}.tar.xz"
        'mpd.tmpfile'
        'mpd.conf')
sha512sums=('c53d386d42c2360502aad5e7574ae5ff76a20df037696989f9e1700f9cffb88afdd329cce758067356c59308d0cbcf3ba3ccf6f013e2fcec54ddf08bd0212b43'
            '3608f8b0418aa5527917c35308aeca80357c3cf1834cceeade2eaab7fa736117c0b3143cf225478441ffc533b45ff1e8c5579a2e1aa432a4db5ca4cef2dd04e1'
            '25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1')
backup=('etc/mpd.conf')
install=mpd.install

prepare() {
	cd "mpd-${pkgver}"

	rm -rf build-my
}

build() {
	cd "mpd-${pkgver}"

	_opts=('-Ddocumentation=enabled'
	       '-Dchromaprint=disabled' # appears not to be used for anything
	       '-Dsidplay=disabled' # unclear why but disabled in the past
	       '-Dadplug=disabled' # not in an official repo
	       '-Dsndio=disabled' # interferes with detection of alsa devices
	       '-Dshine=disabled' # not in an official repo
	       '-Dtremor=disabled' # not in an official repo
	       '-Dao=disabled'
	       '-Djack=disabled'
	       '-Dmodplug=disabled'
	       '-Dshout=disabled'
	       '-Dsidplay=disabled'
	       '-Dsoundcloud=disabled'
         '-Dwavpack=disabled'
	       '-Dzzip=disabled'
	       '-Dzeroconf=disabled'
	       '-Dsmbclient=disabled'
	       '-Dqobuz=disabled'
	       '-Diso9660=disabled'
	       '-Dfluidsynth=disabled'
	       '-Dmikmod=disabled'
	       '-Dmpcdec=disabled'
	       '-Dmpg123=disabled'
	       '-Dopus=disabled'
	       '-Dwildmidi=disabled'
	       '-Dlame=disabled'
	       '-Dtwolame=disabled'
	       '-Dopenal=disabled'
	       '-Dyajl=disabled'
         '-Dgme=disabled'
	)
	arch-meson --auto-features auto build-my ${_opts[@]}
	ninja -C build-my
}

package() {
	cd "mpd-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C build-my install
	install -Dm644 doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example

	install -Dm644 ../mpd.conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

	# Now service file installs only when libsystemd package was found
	if [ -e "${pkgdir}"/usr/lib/systemd/system/mpd.service ]; then
		sed \
			-e '/\[Service\]/a User=mpd' \
			-e '/WantedBy=/c WantedBy=default.target' \
			-i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	fi
}
# vim: ts=2 sw=2 et:
