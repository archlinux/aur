# Maintainer: kryksyh <kryksyh@gmail.com>
pkgname=audacity4-nocloud-git
_pkgname=audacity
pkgver=r0
pkgrel=1
pkgdesc="Audacity 4, the next generation of the popular multi-track audio editor (no cloud integration)"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
depends=(
	qt6-base
	qt6-declarative
	qt6-svg
	qt6-tools
	qt6-shadertools
	qt6-5compat
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
	wxwidgets-gtk3
	zlib
	libpng
	freetype2
	harfbuzz
	alsa-lib
	mesa
)
makedepends=(
	git
	cmake
	ninja
	gcc
	pkgconf
	python
	nasm
)
provides=('audacity4')
conflicts=('audacity4' 'audacity4-bin' 'audacity4-alpha' 'audacity4-git')
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
		-D MUSE_APP_INSTALL_SUFFIX=4 \
		-D MUSE_ENABLE_UNIT_TESTS=OFF \
		-D MUSE_MODULE_DIAGNOSTICS_CRASHPAD_CLIENT=OFF \
		-D MUSE_MODULE_UPDATE=OFF \
		-D AU4_BUILD_MODE=release \
		-D AU_BUILD_CLOUD_AUDIOCOM=OFF \
		-D AU_BUILD_USAGEINFO_MODULE=OFF
	cmake --build build
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
