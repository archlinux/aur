# Maintainer: kryksyh <kryksyh@gmail.com>
# Contributor: Evert Vorster <superchief@evertvorster.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=audacity-git
_pkgname=audacity
pkgver=r0
pkgrel=2
pkgdesc="A program that lets you manipulate digital audio waveforms (Audacity 4 development branch)"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
groups=('pro-audio')
depends=(
	qt6-base
	qt6-declarative
	qt6-svg
	qt6-5compat
	qt6-networkauth
	expat
	libogg
	libvorbis
	flac
	opus
	opusfile
	lame
	mpg123
	wavpack
	libsndfile
	portaudio
	sqlite
	twolame
	libsoxr
	soundtouch
	libsbsms
	lilv
	suil
	zix
	wxwidgets-common
	zlib
	libpng
	freetype2
	harfbuzz
	pugixml
	alsa-lib
	hicolor-icon-theme
)
makedepends=(
	git
	cmake
	ninja
	python
	nasm
	qt6-tools
	qt6-shadertools
	utf8cpp
	vulkan-headers
	vst3sdk
	rapidjson
	lv2
)
provides=(
	'audacity'
	'lv2-host'
	'vst3-host'
)
conflicts=('audacity')
source=(
	"git+https://github.com/audacity/audacity.git"
	"git+https://github.com/musescore/muse_framework.git"
	"git+https://github.com/musescore/muse_deps.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	git config submodule.muse.url "$srcdir/muse_framework"
	git config submodule.muse_deps.url "$srcdir/muse_deps"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/$_pkgname"
	cmake \
		-G Ninja \
		-S . \
		-B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D EXTDEPS_OVERRIDE_ALL=SYSTEM \
		-D WX_CONFIG=/usr/bin/wx-config-base \
		-D MUSE_ENABLE_UNIT_TESTS=OFF \
		-D MUSE_MODULE_DIAGNOSTICS_CRASHPAD_CLIENT=OFF \
		-D MUSE_MODULE_UPDATE=OFF \
		-D AU4_BUILD_MODE=release \
		-D AU_BUILD_USAGEINFO_MODULE=OFF
	cmake --build build
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
