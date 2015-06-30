# Maintainer: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite-git
pkgver=1.8.r0.g8b8dfe6
pkgrel=1
pkgdesc='Lightweight headless squeezebox emulator - git checkout'
arch=('i686' 'x86_64' 'armv6h')
url='http://code.google.com/p/squeezelite/'
license=(GPL3)
depends=('alsa-lib')
makedepends=('git' 'alsa-lib' 'faad2' 'flac' 'libmad' 'libvorbis' 'mpg123'
	'portaudio')
optdepends=('faad2: Support for decoding AAC'
	'flac: Support for decoding FLAC'
	'libmad: Support for decoding MP3'
	'libvorbis: Support for decoding Ogg Vorbis'
	'mpg123: Support for decoding MP3'
	'portaudio: Use of binary using portaudio for output')
provides=('squeezelite')
conflicts=('squeezelite')
source=('git+https://code.google.com/p/squeezelite/')
sha256sums=('SKIP')

pkgver() {
	cd squeezelite/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd squeezelite/

	unset LDFLAGS
	sed -i '/LDFLAGS/s|$| -lm -lasound|' Makefile.pa

	# build squeezelite-pa
	make -f Makefile.pa

	# clean up
	make clean

	# build squeezelite
	make

}

package() {
	cd squeezelite/

	# Install binaries
	install -m0755 -D squeezelite-pa "${pkgdir}/usr/bin/squeezelite-pa"
	install -m0755 -D squeezelite "${pkgdir}/usr/bin/squeezelite"
}

