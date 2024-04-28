# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Hajos Attila <linux.alucard@gmail.com>

pkgname=mpd-sacd
pkgver=0.23.13
pkgrel=1
pkgdesc='MPD with patches for SACD and DVDA ISO playback. (DVDA ISO playback temporary disabled)'
url='https://sourceforge.net/p/sacddecoder/mpd/MPD.git/ci/master/tree/'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
depends=(
    'alsa-lib' 'audiofile' 'expat' 'faad2' 'ffmpeg4.4' 'flac' 'fluidsynth' 'gcc-libs' 'hicolor-icon-theme' 'icu' 'jack' 'lame'
    'libao' 'libcdio' 'libcdio-paranoia' 'libgme' 'libid3tag' 'libmad' 'libmikmod' 'libmms' 'libmodplug' 'libmpcdec' 'libmpdclient'
    'libnfs' 'libogg' 'libopenmpt' 'libpipewire' 'libpulse' 'libshout' 'libsndfile' 'libsamplerate' 'libsoxr' 'libupnp'
    'liburing' 'libvorbis' 'mpg123' 'openal' 'opus' 'pcre2' 'systemd-libs' 'twolame' 'wavpack' 'wildmidi' 'yajl' 'zlib' 'zziplib')
makedepends=('boost' 'meson' 'cmake' 'git' 'python-sphinx_rtd_theme' 'clang' 'ninja')
conflicts=('mpd')
provides=("mpd=${pkgver}")
source=('mpd::git+https://git.code.sf.net/p/sacddecoder/mpd/MPD.git#commit=45f0d8fbce0f52b9aca1f9cce96dcf9c9e1413da'
	'sysusers.d'
	'tmpfiles.d'
	'conf')
sha1sums=('SKIP'
          '7c7de7b30c6c8e1c705dd415692f6a08a3f62c82'
          'd82864959d1a1a07bf75d87c7586dbb713892f3a'
          '291fd5cda9f0845834a553017327c4586bd853f6')
backup=('etc/mpd.conf')

prepare() {
	cd "${srcdir}/mpd/build"
	rm -rf build
	install -d build
}

build() {
	cd "$srcdir/mpd/build"
	export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
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
		'-Ddvdaiso=false' # temporary disabled
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
