# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Maintainer: Hajos Attila <linux.alucard@gmail.com>
# Maintainer: Jay Moore <sacd.dude@this-is-a-wendys.com>

pkgname=mpd-sacd
pkgver=0.25
pkgrel=7
pkgdesc='MPD with patches for SACD and DVD-A ISO playback.'
url='https://github.com/manisiutkin/MPD'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
depends=('adplug'			'alsa-lib'			'audiofile'			'avahi' 			'bzip2'					'chromaprint'
		 'curl'				'dbus'				'expat'				'faad2'				'ffmpeg'				'flac'
		 'fluidsynth'		'fmt'				'glibc'				'gcc-libs'			'hicolor-icon-theme'	'jack2'
		 'icu'				'lame'				'libao'				'libcdio' 			'libcdio-paranoia' 		'libgme'
		 'libid3tag'		'libmad'			'libmms' 			'libmikmod'			'libmodplug' 			'libmpcdec'
		 'libmpdclient'		'libnfs'			'libogg'			'libopenmpt' 		'libsidplayfp'			'nlohmann-json'
		 'libpulse' 		'libshout'			'libsndfile'		'libsamplerate'		'libsoxr' 				'libupnp'
		 'liburing' 		'libvorbis'			'libpipewire'		'sqlite'			'mpg123'				'openal'
		 'opus' 			'pcre2'				'systemd-libs'		'twolame'			'vgmstream-git'			'wavpack'
		 'wildmidi'			'yajl'				'zlib'				'zziplib')
makedepends=('boost' 'meson' 'cmake' 'git' 'llvm' 'python-sphinx_rtd_theme' 'clang' 'ninja')
conflicts=('mpd')
provides=("mpd=${pkgver}")
source=('mpd-sacd::git+https://github.com/manisiutkin/MPD.git'
	'sysusers.d'
	'tmpfiles.d'
	'conf')
sha256sums=('SKIP'
            '0b74c6e5db08daab3091dc15a6b0c75210ba2f9e98fa074f6cfd605a461056b6'
            '2faa85c12449a5b3ca422ff1c1fa06d057c7e262a74bfa6298c914a92d6f2e7a'
            'fafe3300ee01f7f42138fde9e24b9b546ebd193f2d8358f7af3f9f6fe1aed189')
backup=('etc/mpd.conf')

prepare() {
	cd "${srcdir}/mpd-sacd"
	# Prepare build directory
	rm -rf build
	install -dm755 build
}

build() {
	cd "$srcdir/mpd/build"
	_opts=(# in AUR, needs testing
		   #'-Dadplug=disabled'
		   # interferes with detection of alsa devices
		   '-Dsndio=disabled'
		   # exists in AUR, works, but we don't need it
		   '-Dshine=disabled'
		   # exists in AUR, won't build, don't need it
		   '-Dtremor=disabled')
		   # not in official repo (and not libsidplayfp)
		   #'-Dsidplay=disabled'
		   # they say libsidplayfp is supported....
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

