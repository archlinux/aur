# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: E5ten <e5ten.arch@gmail.com>
# Contributor: anna <morganamilo@gmail.com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-git
_pkgname=mpd
pkgver=0.21.23.r976.geeec0ee80
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music (from git)'
url='https://www.musicpd.org/'
license=('GPL')
arch=('x86_64')
depends=('audiofile' 'avahi' 'curl' 'faad2' 'ffmpeg' 'fluidsynth'
	 'icu' 'jack' 'libao' 'libcdio-paranoia' 'libgme' 'libid3tag' 'libmad'
	 'libmikmod' 'libmms' 'libmodplug' 'libmpcdec' 'libmpdclient' 'libnfs'
	 'libsamplerate' 'libshout' 'libsoxr' 'libvorbis' 'systemd-libs'
	 'libupnp' 'mpg123' 'openal' 'smbclient' 'sqlite' 'twolame' 'wavpack'
	 'wildmidi' 'yajl' 'zziplib')
makedepends=('boost' 'meson' 'liburing' 'python-sphinx')
provides=('mpd')
conflicts=('mpd')
source=("$_pkgname::git+https://github.com/MusicPlayerDaemon/MPD"
        'tmpfiles.d'
        'sysusers.d'
        'conf')
sha256sums=('SKIP'
            '2faa85c12449a5b3ca422ff1c1fa06d057c7e262a74bfa6298c914a92d6f2e7a'
            '0b74c6e5db08daab3091dc15a6b0c75210ba2f9e98fa074f6cfd605a461056b6'
            'f40f68205834ca53cea3372e930bfe6c2f9ecc9df3b1605df2fec63a658b2e03')

backup=('etc/mpd.conf')

pkgver() {
	cd "${_pkgname}"

	git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	rm -fr build
	install -d build
}

build() {
	cd "${_pkgname}/build"
	_opts=('-Ddocumentation=true'
	       '-Dchromaprint=disabled' # appears not to be used for anything
	       '-Dsidplay=disabled' # unclear why but disabled in the past
	       '-Dadplug=disabled' # not in an official repo
	       '-Dsndio=disabled' # interferes with detection of alsa devices
	       '-Dshine=disabled' # not in an official repo
	       '-Dtremor=disabled' # not in an official repo
	)
	arch-meson .. ${_opts[@]}
	ninja
}

package() {
	cd "${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install
	install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example
	install -Dm644 ../doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
	install -Dm644 ../doc/mpd.1 "${pkgdir}"/usr/share/man/man1/mpd.1

	install -Dm644 ../../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -Dm644 ../../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/mpd.conf
	install -Dm644 ../../conf "${pkgdir}"/etc/mpd.conf

	sed \
		-e '/\[Service\]/a User=mpd' \
		-e '/WantedBy=/c WantedBy=default.target' \
		-i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}
