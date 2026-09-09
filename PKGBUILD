# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-pcee2
pkgname=$_pkgname-git
pkgver=r23120.7839d51
pkgrel=1
pkgdesc="Sony PlayStation 2 core (port of current PCSX2)"
arch=('x86_64')
url="https://github.com/WizzardSK/pcee2-libretro"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=(
	'glibc'
	'libretro-core-info>=1.22.2.r20'
	'libx11'
	'libxi'
	'sdl3'
)
makedepends=(
	'cmake'
	'curl'
	'dbus'
	'extra-cmake-modules'
	'ffmpeg4.4'
	'freetype2'
	'git'
	'libbacktrace'
	'libgcc'
	'libgl'
	'libjpeg-turbo'
	'libpcap'
	'libpng'
	'libstdc++'
	'libsystemd'
	'libwebp'
	'libxrandr'
	'lz4'
	'plutosvg'
	'plutovg'
	'rapidyaml'
	'shaderc'
	'wayland'
	'zlib'
	'zstd'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	local options=(
		-B ../build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4"
		-D CMAKE_LIBRARY_PATH="/usr/lib/ffmpeg4.4"
		-D DISABLE_ADVANCE_SIMD=ON
		-D ENABLE_LIBRETRO=ON
		-D ENABLE_QT_UI=OFF
		-D ENABLE_TESTS=OFF
		-W no-dev
	)
	cd $_pkgname
	cmake "${options[@]}"
	cmake --build ../build
}

package() {
	depends+=(
		'libbacktrace.so'
		'libcurl.so'
		'libdbus-1.so'
		'libfreetype.so'
		'libgcc_s.so'
		'libjpeg.so'
		'liblz4.so'
		'libplutosvg.so'
		'libplutovg.so'
		'libpng16.so'
		'libryml.so'
		'libstdc++.so'
		'libudev.so'
		'libwebp.so'
		'libz.so'
		'libzstd.so'
	)

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/bin/pcee2_libretro.so
}
