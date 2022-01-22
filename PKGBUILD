# Maintainer: bobosito <bobosito000@gmail.com>

pkgname=qgroundcontrol-git
pkgver=v4.2.0.r47.96401ec30
pkgrel=1
epoch=
pkgdesc="ground control system for px4 autopilot"
arch=('any')
url=""
license=('GPL')
groups=()
depends=('bzip2'
         'dbus'
         'flac'
         'gst-plugins-base-libs'
         'libasyncns'
         'libffi'
         'libgcrypt'
         'libgpg-error'
         'libogg'
         'libsndfile'
         'libsystemd'
         'libunwind'
         'libx11'
         'libxau'
         'libxcb'
         'libxdmcp'
         'libxext'
         'lz4'
         'orc'
         'pcre'
         'sdl2'
         'xz'
         'zlib'
         'icu'
         'qt5-speech'
         'qt5-multimedia'
         'qt5-serialport'
         'qt5-charts'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-location'
         'qt5-svg'
         'qt5-graphicaleffects'
         'qt5-tools'
         'qt5-wayland'
         'qt5-x11extras'
)

makedepends=('git' 'qt5-base')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=

source=(
	"git://github.com/mavlink/qgroundcontrol.git"
	"git://github.com/PX4/GpsDrivers.git"
	"git://github.com/mavlink/c_library_v2.git"
	"git://github.com/Auterion/android_openssl.git"
	"git://github.com/mavlink/gst-plugins-good.git"
	"git://github.com/Auterion/xz-embedded.git"
	"git://github.com/mavlink/libevents.git"
	"eigen::git+https://gitlab.com/libeigen/eigen.git"
	"git://github.com/patrickelectric/qmdnsengine.git"

	"git://github.com/ArthurSonzogni/nlohmann_json_cmake_fetchcontent.git"

	# "gst-plugins-good-volatile.patch"::"https://patch-diff.githubusercontent.com/raw/mavlink/gst-plugins-good/pull/1.patch"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	# '8e32ff6ff83cbe12a798920a010061cf9f4ec7b178362dde517b4bc71555f8a2'
)
# noextract=("v2020.3.tar.gz")
md5sums=()
validpgpkeys=()

pkgver() {
	src_qgc=$srcdir/${pkgname%-git}
	cd $src_qgc
	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


prepare() {
	src_qgc=$srcdir/${pkgname%-git}
	cd "$srcdir/GpsDrivers"
	git submodule init
	rm -rf $src_qgc/GPS/Drivers
	git config submodule.GpsDrivers.url $src_qgc/GPS/Drivers

	cd $srcdir/c_library_v2
	git submodule init
	cd $srcdir/android_openssl
	git submodule init
	rm -rf ""
	git config submodule.android_openssl.url $src_qgc/libs/OpenSSL/android_openssl

	cd $srcdir/gst-plugins-good
	git submodule init
	# git apply "$srcdir/gst-plugins-good-volatile.patch"
	git config submodule.gst-plugins-good.url $src_qgc/libs/qmlglsink/gst-plugins-good

	cd $srcdir/xz-embedded
	git submodule init
	git config submodule.xz-embedded.url $src_qgc/libs/xz-embedded

	cd $srcdir/libevents
	git submodule init
	git config submodule.libevents.url $src_qgc/libs/libevents/libevents

	cd $srcdir/eigen
	git submodule init
	git config submodule.eigen.url $src_qgc/libs/eigen

	cd $srcdir/qmdnsengine
	git submodule init
	git config submodule.qmdnsengine.url $src_qgc/libs/qmdnsengine

	cd $srcdir/nlohmann_json_cmake_fetchcontent
	git submodule init
	git config submodule.nlohmann_json_cmake_fetchcontent.url $src_qgc/libs/nlohmann_json

	cd $src_qgc
	# git submodule update --init --recursive
	# git apply $srcdir/patch

	# echo $PWD
	# patch -p1 -i "$srcdir/patch"
	cmake . -B ./build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
}

build() {
	cd $srcdir/${pkgname%-git}
	cmake --build ./build
}
# check() {
# 	cd build
# 	# ctest --output-on-failure
# }

package() {
	cd $srcdir/${pkgname%-git}/build
	make DESTDIR=$pkgdir install
}
