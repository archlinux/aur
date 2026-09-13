# Maintainer: kryksyh <kryksyh@gmail.com>
# Contributor: Evert Vorster <superchief@evertvorster.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity3-git
_pkgname=audacity
pkgver=r0
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms (Audacity 3 maintenance branch)"
arch=('x86_64')
url="https://www.audacityteam.org/"
license=('GPL-3.0-or-later')
groups=('pro-audio')
depends=(
	alsa-lib
	curl
	expat
	flac
	gcc-libs
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	jack
	lame
	libid3tag
	libogg
	libsbsms
	libsndfile
	libsoxr
	libvorbis
	libx11
	lilv
	mpg123
	opus
	opusfile
	portaudio
	portmidi
	portsmf
	soundtouch
	sqlite
	suil
	twolame
	util-linux-libs
	vamp-plugin-sdk
	wavpack
	wxwidgets-common
	wxwidgets-gtk3
)
makedepends=(
	cmake
	ffmpeg
	git
	gtkmm3
	libxkbcommon-x11
	lv2
	python
	rapidjson
	vst3sdk
	xcb-util
	xcb-util-cursor
	xcb-util-keysyms
)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(
	'audacity'
	'ladspa-host'
	'lv2-host'
	'vamp-host'
	'vst-host'
	'vst3-host'
)
conflicts=('audacity')
# https://github.com/progschj/ThreadPool
source=(
	"git+https://github.com/audacity/audacity.git#branch=audacity3"
	ThreadPool.h
	ThreadPoolConfig.cmake
)
sha256sums=(
	'SKIP'
	'61901774721b1a571d8112e7316be8f18ac1749861c5e662dc86e23393df3a85'
	'c855a446a4b0b5013d05cdd5e9fc397365b0873a2e9d4c8a29841a2d9694138b'
)

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare() {
	install -Dm 644 ThreadPool.h threadpool/include/ThreadPool/ThreadPool.h
	install -Dm 644 ThreadPoolConfig.cmake threadpool/ThreadPoolConfig.cmake
}

build() {
	export VST3SDK=/usr/src/vst3sdk
	export CFLAGS+=" -DNDEBUG -std=gnu17"
	export CXXFLAGS+=" -DNDEBUG"

	cmake \
		-S "$srcdir/$_pkgname" \
		-B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D AUDACITY_BUILD_LEVEL=2 \
		-D audacity_conan_enabled=OFF \
		-D audacity_has_networking=ON \
		-D audacity_has_audiocom_upload=ON \
		-D audacity_has_url_schemes_support=ON \
		-D audacity_has_updates_check=OFF \
		-D audacity_has_crashreports=OFF \
		-D audacity_has_sentry_reporting=OFF \
		-D audacity_has_tests=OFF \
		-D ThreadPool_DIR="$srcdir/threadpool" \
		-D audacity_lib_preference=system \
		-D audacity_obey_system_dependencies=ON \
		-D audacity_use_vst3sdk=system \
		-W no-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -vDm 644 "$srcdir/$_pkgname/lib-src/libnyquist/nyquist/license.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.nyquist"
}
