# Maintainer: cysp74 at gmail dot com
_name=ocp-curses
pkgname="${_name}-git"
pkgver=0.2.102.r2.g0065417
pkgrel=1
pkgdesc="Open Cubic Player - ncurses only (GIT Version)"
arch=('i686' 'x86_64')
url="http://stian.cubic.org/project-ocp.php"
license=('GPL')
depends=('pulseaudio-alsa' 'cjson' 'libdiscid' 'libancient')
optdepends=('adplug: for OPL formats support'
			'alsa-lib: for ALSA output'
			'flac: for FLAC audio support'
			'libmad: for MPEG audio support'
			'libvorbis: for Vorbis audio support')
makedepends=( 'git' 'xa' )
provides=("${_name}=${pkgver}" "${_name}-git=${pkgver}")
conflicts=('ocp' 'ocp-git')
install=$pkgname.install
source=("${_name}::git+https://github.com/mywave82/opencubicplayer.git")
md5sums=('SKIP' )

prepare() {
	cd "${srcdir}/${_name}"
}

pkgver() {
	git -C "${_name}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "${srcdir}/${_name}"
	git submodule init
	git submodule update

	git submodule update --init --recursive

	CONFIG="--prefix=/usr --sysconfdir=/etc \
	--with-timidity-default-path=/etc/timidity++/ \
	--without-x11 \
	--without-sdl \
	--without-sdl2 \
	--with-ncurses \
	--without-debug"

	./configure ${CONFIG}
	make clean
	make
}

package() {
	cd "${srcdir}/${_name}"
	make DESTDIR="${pkgdir}" install
}
