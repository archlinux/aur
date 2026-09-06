# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-beta
_mixxxver=2.6
pkgver="${_mixxxver}.beta"
pkgrel=8
pkgdesc="Digital DJ mixing software (beta branch)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL-2.0-or-later')
groups=(pro-audio)
depends=(
	# TODO: Running into an error with the AUR version, let cmake download it.
	#'libshout-idjc'
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
	'libsndfile'
	'libusb'
	'libvorbis'
	'lilv'
	'openssl'
	'opusfile'
	'portaudio'
	'portmidi'
	'protobuf'
	'qt6-5compat'
	'qt6-declarative'
	'qt6-svg'
	'qt6-translations'
	'qtkeychain-qt6'
	'rubberband'
	'soundtouch'
	'sqlite'
	'taglib'
	'ttf-opensans'
	'ttf-ubuntu-font-family'
	'upower'
	'wavpack'
	'zlib'
)
makedepends=(
	'cmake'
	'git'
	'glu'
	'gtest'
	'lv2'
	'microsoft-gsl'
	'qt6-shadertools'
	'qt6-tools'
)
optdepends=(
	'ccache: speed up rebuilds of the package'
)
provides=('mixxx')
conflicts=('mixxx')
source=("mixxx-${_mixxxver}-beta.tar.gz::https://github.com/mixxxdj/mixxx/archive/refs/tags/${_mixxxver}-beta.tar.gz")
sha256sums=('3683cf0570e2f9dbeb1d76a5d617f8c2bf2acb6d15fe9d2337b8f49a20887a38')

build() {
	local ccache_support=$(hash ccache 2>/dev/null && echo -n "ON" || echo -n "OFF")
	local cmake_options=(
		-B build
		-D CMAKE_LINKER_TYPE=BFD
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_BENCH=OFF
		-D OPTIMIZE=native
		-D CCACHE_SUPPORT="${ccache_support}"
		-D CMAKE_C_FLAGS='-O2'
		-D CMAKE_C_FLAGS_RELEASE='-DNDEBUG'
		-D CMAKE_C_FLAGS_RELWITHDEBINFO='-g -DNDEBUG'
		-D PIPEWIRE=ON
		-D SITE=arch
		# TODO: I'd like to do this, but libshout-idjc in the AUR Is old?
		# -D FETCHCONTENT_FULLY_DISCONNECTED=ON
		-S mixxx-$_mixxxver-beta
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

# vim:set ts=2 sw=2
