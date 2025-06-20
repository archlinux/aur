# Maintainer: Elia Nitsche <nitscheelia at gmail.com>

pkgname=fauxdacious-plugins-git
_pkgname=fauxdacious-plugins
pkgver=4.5.r659
pkgrel=3
pkgdesc="Plugins for the Fauxdacious Mediaplayer (git version)"
arch=('x86_64')
url="https://wildstar84.wordpress.com/fauxdacious/"
license=('BSD' 'custom')
depends=(
		'alsa-lib' 'curl' 'faad2' 'ffmpeg' 'flac' 'fluidsynth'
		'jack' 'json-glib' 'lame' 'libbs2b' 'libcddb' 'libcdio-paranoia'
		'libcue' 'libmms' 'libmodplug' 'libmtp' 'libnotify' 'libopenmpt'
		'libpipewire' 'libpulse' 'libsamplerate' 'libsidplayfp' 'libvorbis'
		'lirc' 'mpg123' 'neon' 'opusfile' 'wavpack')
makedepends=('fauxdacious-git' 'make' 'autoconf' 'automake' 'git' 'glib2-devel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://github.com/wildstar84/fauxdacious-plugins.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	# get the version out of the configure.ac file and add commit count
	_versionDash=$(grep AC_INIT configure.ac | sed -E "s/.*\[(.*)\], \[(.*)\].*/\2/")
	_versionBase=${_versionDash%%-*}
	_commits=$(git rev-list --count HEAD)
	echo "${_versionBase}.r${_commits}"
}

prepare() {
	cd "${pkgname}"
	# configure autoreconf
	aclocal -I /usr/share/gettext/m4
	autoreconf -fvi
	# configure the build environment with scripts from upstream
	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR=${pkgdir} install
	install -Dm644 ./COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
