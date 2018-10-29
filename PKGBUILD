# Maintainer: E5ten <e5ten.arch@gmail.com>
# Maintainer: anna <morganamilo@gmail.com>
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
pkgver=0.20.23.r1494.g901229699
pkgrel=2
pkgdesc='Flexible, powerful, server-side application for playing music'
url='https://www.musicpd.org/'
license=('GPL')
arch=('x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl'
	 'faad2' 'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl'
	 'libmpdclient' 'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr'
	 'smbclient' 'libgme' 'zziplib' 'libsystemd' 'openal' 'mpg123')
makedepends=('boost' 'doxygen' 'meson')
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

build() {
	arch-meson ${_pkgname} build \
		-Djack=enabled \
		-Ddsd=false \
		-Dlibmpdclient=enabled \
		-Dpipe=true \
		-Dpulse=enabled \
		-Dqobuz=disabled \
		-Dsoundcloud=enabled \
		-Dtidal=disabled \
		-Dzzip=enabled \
		-Dsidplay=disabled \
		-Dlibwrap=disabled \
		-Droar=disabled \
		-Dsndio=disabled \
		-Dchromaprint=disabled \
		-Dcdio_paranoia=disabled \
		-Diso9660=disabled \
		-Dadplug=disabled \
		-Dfluidsynth=disabled \
		-Dmikmod=disabled \
		-Dmpcdec=disabled \
		-Dwildmidi=disabled \
		-Dtwolame=disabled \
		-Dshine=disabled \
		-Dsystemd=enabled \
		-Dsystemd_system_unit_dir=/usr/lib/systemd/system \
		-Dsystemd_user_unit_dir=/usr/lib/systemd/user

	ninja -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	cd "${_pkgname}"
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -Dm644 ../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/mpd.conf

	sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}


pkgver() {
  cd "${_pkgname}"

  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}
