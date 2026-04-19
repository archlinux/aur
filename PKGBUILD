# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-git
pkgver=r9741
pkgrel=1
pkgdesc="Digital DJ mixing software (latest development branch)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL-2.0-or-later')
groups=('pro-audio')
depends=(
	'chromaprint'
	'ffmpeg'
	'flac'
	'glib2'
	'glibc'
	'hidapi'
	'lame'
	'libebur128'
	'libglvnd'
	'libid3tag'
	'libkeyfinder'
	'libmad'
	'libmodplug'
	'libmp4v2'
	'libogg'
	'libshout'
	'libsndfile'
	'libtheora'
	'libusb'
	'libvorbis'
	'lilv'
	'opusfile'
	'portaudio'
	'portmidi'
	'protobuf'
	'qt6-5compat'
	'qt6-declarative'
	'qt6-shadertools'
	'qt6-svg'
	'qt6-translations'
	'qtkeychain-qt6'
	'rubberband'
	'soundtouch'
	'sqlite'
	'taglib1'
	'ttf-opensans'
	'ttf-ubuntu-font-family'
	'upower'
	'wavpack'
	'zlib'
)
makedepends=(
	'benchmark'
	'cmake'
	'git'
	'gtest'
	'lv2'
	'microsoft-gsl'
	'qt6-tools'
)
optdepends=(
	'ccache: speed up rebuilds of the package'
)
provides=('mixxx')
conflicts=('mixxx')
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-*}"
    echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

build() {
	local cmake_options=(
		-B build
		-D CMAKE_BUILD_TYPE=RelWithDebInfo
		-D CMAKE_INSTALL_PREFIX=/usr
		-D OPTIMIZE=native
		-S mixxx
		-W no-dev
	)

	export QT_NO_PRIVATE_MODULE_WARNING=ON
	export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
	cmake "${cmake_options[@]}"
	cmake --build build --parallel "$(nproc)" --target mixxx
}

check() {
	cmake --build build --parallel "$(nproc)" --target mixxx-test
	ctest --test-dir build --parallel "$(nproc)" --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
