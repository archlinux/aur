# Maintainer: Melvin Vermeeren <mail@mel.vin>

pkgname=mpd-sacd
pkgver=0.21.5
pkgrel=3
pkgdesc='MPD with patches for SACD and DVDA ISO playback.'
url='https://sourceforge.net/p/sacddecoder/mpd/MPD.git/ci/master/tree/'
license=('GPL')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
	'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient'
	'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'smbclient' 'libcdio-paranoia'
	'libgme' 'zziplib')
makedepends=('boost' 'meson' 'python-sphinx')
conflicts=('mpd')
provides=("mpd=${pkgver}")
source=('mpd::git+https://git.code.sf.net/p/sacddecoder/mpd/MPD.git#commit=f95306d636e5a2f79a198ff184c2e09ebd2f9039'
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
	_opts=('-Ddocumentation=true'
		'-Dchromaprint=disabled' # appears not to be used for anything
		'-Dsidplay=disabled' # unclear why but disabled in the past
		'-Dadplug=disabled' # not in an official repo
		'-Dsndio=disabled' # interferes with detection of alsa devices
		'-Dshine=disabled' # not in an official repo
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
	arch-meson .. ${_opts[@]}
	ninja
}

package() {
	cd "${srcdir}/mpd/build"
	DESTDIR="${pkgdir}" ninja install
	install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example
	install -Dm644 ../doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
	install -Dm644 ../doc/mpd.1 "${pkgdir}"/usr/share/man/man1/mpd.1

	install -Dm644 ../../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/mpd.conf
	install -Dm644 ../../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf

	sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}
