# Maintainer: Melvin Vermeeren <mail@mel.vin>

pkgname=mpd-sacd
pkgver=0.22.1
pkgrel=1
pkgdesc='MPD with patches for SACD and DVDA ISO playback.'
url='https://sourceforge.net/p/sacddecoder/mpd/MPD.git/ci/master/tree/'
license=('GPL')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
	'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient'
	'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'smbclient' 'libcdio-paranoia'
	'libgme' 'zziplib' 'fluidsynth' 'libmikmod' 'wildmidi')
makedepends=('boost' 'meson' 'python-sphinx' 'clang' 'ninja')
conflicts=('mpd')
provides=("mpd=${pkgver}")
source=('mpd::git+https://git.code.sf.net/p/sacddecoder/mpd/MPD.git#commit=ed387398fa3287d840da791005ec8dad9a81cc7d'
	'sysusers.d'
	'tmpfiles.d'
	'conf')
sha1sums=('SKIP'
          '7c7de7b30c6c8e1c705dd415692f6a08a3f62c82'
          'd82864959d1a1a07bf75d87c7586dbb713892f3a'
          '291fd5cda9f0845834a553017327c4586bd853f6')
backup=('etc/mpd.conf')

prepare() {
	cd "${srcdir}/mpd"
	rm -rf build
	install -d build
}

build() {
	cd "${srcdir}/mpd/build"
	_opts=('-Ddocumentation=enabled'
		'-Dchromaprint=disabled' # appears not to be used for anything
		'-Dsidplay=disabled' # unclear why but disabled in the past
		'-Dadplug=disabled' # not in an official repo
		'-Dsndio=disabled' # interferes with detection of alsa devices
		'-Dshine=disabled' # not in an official repo
		'-Dtremor=disabled' # not in official repo
		'-Dcdio_paranoia=enabled'
		'-Diso9660=enabled'
		'-Djack=enabled'
		'-Dlibmpdclient=enabled'
		'-Dpipe=true'
		'-Dpulse=enabled'
		'-Dsoundcloud=enabled'
		'-Dzzip=enabled'
		'-Dsacdiso=true'
		'-Ddvdaiso=true'
	)
	env CC=clang CXX=clang++ arch-meson .. ${_opts[@]}
	ninja
}

package() {
	cd "${srcdir}/mpd/build"
	DESTDIR="${pkgdir}" ninja install
	install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example
	install -Dm644 doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
	install -Dm644 doc/mpd.1 "${pkgdir}"/usr/share/man/man1/mpd.1

	install -Dm644 ../../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/mpd.conf
	install -Dm644 ../../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf

	sed \
		-e '/\[Service\]/a User=mpd' \
		-e '/WantedBy=/c WantedBy=default.target' \
		-i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}
