# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

_pkgbase=mpd
pkgname=${_pkgbase}-youtube-dl
pkgver=0.21.16
pkgrel=1
pkgdesc='mpd fork with youtube support'
url='https://github.com/MusicPlayerDaemon/MPD/pull/223'
conflicts=('mpd')
license=('GPL')
arch=('x86_64')
depends=('audiofile' 'avahi' 'curl' 'faad2' 'ffmpeg' 'fluidsynth' 'icu' 'jack'
         'libao' 'libcdio-paranoia' 'libgme' 'libid3tag' 'libmad' 'libmikmod'
         'libmms' 'libmodplug' 'libmpcdec' 'libmpdclient' 'libnfs'
         'libsamplerate' 'libshout' 'libsoxr' 'libsystemd' 'libupnp' 'mpg123'
         'openal' 'smbclient' 'sqlite' 'twolame' 'wavpack' 'wildmidi' 'yajl'
         'zziplib')
optdepends=('youtube-dl: youtube and other streaming site support')
makedepends=('boost' 'meson' 'python-sphinx')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
source=("https://www.musicpd.org/download/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.xz"{,.sig}
        'tmpfiles.d'
        'sysusers.d'
        'conf'
        "youtube-dl-$pkgver.patch::https://github.com/MusicPlayerDaemon/MPD/compare/v$pkgver...arcnmx:ytdl-$pkgver.patch")
backup=('etc/mpd.conf')

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	rm -fr build
	install -d build
	patch -Np1 < "${srcdir}/youtube-dl-$pkgver.patch"
}

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}/build"
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
	cd "${srcdir}/${_pkgbase}-${pkgver}/build"
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

# makepkg -g >> PKGBUILD
sha256sums=('30cf1bddf7d7388487276745ad3515f134e07f0c57f9f97cb2b5d3befd4a4d92'
            'SKIP'
            '2faa85c12449a5b3ca422ff1c1fa06d057c7e262a74bfa6298c914a92d6f2e7a'
            '0b74c6e5db08daab3091dc15a6b0c75210ba2f9e98fa074f6cfd605a461056b6'
            'f40f68205834ca53cea3372e930bfe6c2f9ecc9df3b1605df2fec63a658b2e03'
            'a07aa2e6094e656005502ee0fca3985091a876590404688a16b7e73bbb2c3c92')
