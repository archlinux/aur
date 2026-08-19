# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-git
pkgver=r9850
pkgrel=1
pkgdesc="Digital DJ mixing software (latest development branch)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL-2.0-or-later')
groups=(pro-audio)
depends=(
	glibc
	hicolor-icon-theme
	hidapi
	lame
	libebur128
	libgcc
	libkeyfinder
	libmad
	libmodplug
	libmp4v2
	libstdc++
	libx11
	openssl
	opus
	opusfile
	qt6-5compat
	qt6-base
	qt6-declarative
	qt6-multimedia
	qt6-svg
	qtkeychain-qt6
	soundtouch
	sqlite
	taglib
	upower
	wavpack
)
makedepends=(
	chromaprint
	cmake
	faad2
	ffmpeg
	flac
	git
	glib2
	glu
	gperftools
	gtest
	libid3tag
	libogg
	libsndfile
	libusb
	libvorbis
	lilv
	lv2
	microsoft-gsl
	qt6-shadertools
	qt6-tools
	portaudio
	portmidi
	protobuf
	rubberband
)
optdepends=(
	'ccache: speed up rebuilds of the package'
	'pipewire: native pipewire support'
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
		-D CMAKE_LINKER_TYPE=BFD
		-D CMAKE_BUILD_TYPE=RelWithDebInfo
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_BENCH=OFF
		-D OPTIMIZE=native
		-D CCACHE_SUPPORT=ON
		-D CMAKE_C_FLAGS='-O2'
		-D CMAKE_C_FLAGS_RELEASE='-DNDEBUG'
		-D CMAKE_C_FLAGS_RELWITHDEBINFO='-g -DNDEBUG'
		-D PIPEWIRE=ON
		-D SITE=arch
		# TODO: I'd like to do this, but libshout-idjc in the AUR Is old?
		# -D FETCHCONTENT_FULLY_DISCONNECTED=ON
		-S mixxx
		-W no-dev
	)

	export QT_NO_PRIVATE_MODULE_WARNING=ON
	cmake "${cmake_options[@]}"
	cmake --build build --parallel "$(nproc)" --target mixxx
}

check() {
	cmake --build build --parallel "$(nproc)" --target mixxx-test
	ctest --test-dir build --parallel "$(nproc)" --output-on-failure
}

package() {
	depends+=(
		chromaprint libchromaprint.so
		flac libFLAC.so
		ffmpeg libavcodec.so libavformat.so libavutil.so
		glib2 libgobject-2.0.so
		libglvnd libOpenGL.so
		libid3tag libid3tag.so
		libogg libogg.so
		libsndfile libsndfile.so
		libusb libusb-1.0.so
		libvorbis libvorbis.so libvorbisenc.so libvorbisfile.so
		lilv liblilv-0.so
		portaudio libportaudio.so
		portmidi libportmidi.so
		protobuf libprotobuf-lite.so
		rubberband librubberband.so
	)

	DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2
