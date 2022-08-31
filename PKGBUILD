# Maintainer: Amber <amber@mail.cyborgtrees.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mpd-light
pkgver=0.23.9
_majorver=0.23
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without ao, ffmpeg, jack, modplug, pulse, shout, sidplay, soundcloud, wavpack, avahi, smbclient and zziplib support.'
url='https://www.musicpd.org/'
license=('GPL2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('alsa-lib' 'flac' 'libogg' 'audiofile' 'libmad' 'curl' 'faad2' 'sqlite'
         'libmms' 'libid3tag' 'libmpdclient' 'icu' 'libupnp' 'libvorbis'
         'libnfs' 'libsamplerate' 'libsoxr' 'libgme' 'liburing')
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
sha512sums=('67db093e35693f79267f955463ecaa284773b5e47a38f1548a0d16c9ba82aecc3434fd805e224b78782c5978c07e16d26f7632823e536f5304f557985f028d6e'
            '3608f8b0418aa5527917c35308aeca80357c3cf1834cceeade2eaab7fa736117c0b3143cf225478441ffc533b45ff1e8c5579a2e1aa432a4db5ca4cef2dd04e1'
            'f3eaa25925887ae5df52da0119a77729b5761c175a22117ab15a1636b141f4b159db75dc4e9a52e0d16b2bc4b0f617a4e0838a8d3624f98706beb3387971c660')
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
	       '-Dao=disabled'
	       '-Dffmpeg=disabled'
	       '-Dpipewire=disabled'
	       '-Djack=disabled'
	       '-Dmodplug=disabled'
	       '-Dpulse=disabled'
	       '-Dshout=disabled'
	       '-Dsidplay=disabled'
	       '-Dsoundcloud=disabled'
	       '-Dwavpack=disabled'
	       '-Dzzip=disabled'
	       '-Dzeroconf=disabled'
	       '-Dsmbclient=disabled'
	       '-Dcdio_paranoia=disabled'
	       '-Dqobuz=disabled'
	       '-Diso9660=disabled'
	       '-Dtremor=disabled'
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
