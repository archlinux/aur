# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Hajos Attila <linux.alucard@gmail.com>
# Maintainer: Jay Moore <sacd.dude@this-is-a-wendys.com>

pkgname=mpd-sacd
pkgver=0.25
pkgrel=4
pkgdesc='MPD with patches for SACD and DVD-A ISO playback.'
url='https://sourceforge.net/p/sacddecoder/mpd/MPD.git/ci/master/tree/'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
depends=('alsa-lib'			'audiofile'			'avahi' 		'bzip2'					'chromaprint'	'curl'
		 'dbus'				'expat'				'faad2'			'ffmpeg'				'flac' 			'fluidsynth'
		 'fmt'				'glibc'				'gcc-libs'		'hicolor-icon-theme'	'jack2' 		'icu'
		 'lame'				'libao'				'libcdio' 		'libcdio-paranoia' 		'libgme'		'libid3tag'
		 'libmad'			'libmms' 			'libmikmod'		'libmodplug' 			'libmpcdec'		'libmpdclient'
		 'libnfs'			'libogg'			'libopenmpt' 	'nlohmann-json'			'libpulse' 		'libshout'
		 'libsndfile'		'libsamplerate'		'libsoxr' 		'libupnp' 				'liburing' 		'libvorbis'
		 'libpipewire'		'sqlite'			'mpg123' 		'openal' 				'opus' 			'pcre2'
		 'systemd-libs'		'twolame'			'wavpack'		'wildmidi'				'yajl'			'zlib'
		 'zziplib')
makedepends=('boost' 'meson' 'cmake' 'git' 'llvm' 'python-sphinx_rtd_theme' 'clang' 'ninja')
conflicts=('mpd')
provides=("mpd=${pkgver}")
source=('mpd::git+https://git.code.sf.net/p/sacddecoder/mpd/MPD.git'
	'sysusers.d'
	'tmpfiles.d'
	'conf')
sha1sums=('SKIP'
          '7c7de7b30c6c8e1c705dd415692f6a08a3f62c82'
          'd82864959d1a1a07bf75d87c7586dbb713892f3a'
          '77d6ba1fb8cd2c7f39bd7f7ce174928b97a95e87')
backup=('etc/mpd.conf')

prepare() {
	cd "${srcdir}/mpd"
	# Prepare build directory
	rm -rf build
	install -dm755 build
}

build() {
	cd "$srcdir/mpd/build"
	_opts=(# not in an official repo
		   '-Dadplug=disabled'
		   # interferes with detection of alsa devices
		   '-Dsndio=disabled'
		   # not in an official repo
		   '-Dshine=disabled'
		   # not in official repo
		   '-Dtremor=disabled'
		   # not in official repo (and not libsidplayfp)
		   '-Dsidplay=disabled')
		   # DVD-Audio support re-enabled. "Worked on my machine" -Jay
	# Use clang to match previous build environment; works with meson and avoids toolchain issues
	env CC=clang CXX=clang++ arch-meson .. "${_opts[@]}"
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
	-e '/^\[Service\]/a User=mpd' \
	-e '/^ExecStart=/c ExecStart=/usr/bin/mpd --systemd /etc/mpd.conf' \
	-e '/^WantedBy=/c WantedBy=default.target' \
	-i "${pkgdir}/usr/lib/systemd/system/mpd.service"
}

