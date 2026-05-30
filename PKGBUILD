# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-ppsspp
pkgname=$_pkgname-git
pkgver=1.20.4.r124.g736dfc4
pkgrel=1
pkgdesc="Sony PlayStation Portable core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.ppsspp.org/"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=(
	'cmake'
	'ffmpeg'
	'git'
	'glew'
	'libchdr'
	'libgcc'
	'libgl'
	'libpng'
	'libstdc++'
	'libzip'
	'miniupnpc'
	'openxr'
	'python'
	'rapidjson'
	'snappy'
	'zlib'
	'zstd'
)
optdepends=('ppsspp-assets')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	'ppsspp::git+https://github.com/hrydgard/ppsspp.git'
	'ppsspp-glslang::git+https://github.com/hrydgard/glslang.git'
	'ppsspp-lua::git+https://github.com/hrydgard/ppsspp-lua.git'
	'aemu_postoffice::git+https://github.com/Kethen/aemu_postoffice.git'
	'armips::git+https://github.com/Kingcom/armips.git'
	'cpu_features::git+https://github.com/google/cpu_features.git'
	'libretro-common::git+https://github.com/libretro/libretro-common.git'
	'rcheevos::git+https://github.com/RetroAchievements/rcheevos.git'
	'spirv-cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git'
)
b2sums=('SKIP'{,,,,,,,,})

pkgver() {
	cd ppsspp
	git describe --long --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd ppsspp
	git config submodule.cpu_features.url ../cpu_features
	git config submodule.ext/aemu_postoffice.url ../aemu_postoffice
	git config submodule.ext/armips.url ../armips
	git config submodule.ext/glslang.url ../ppsspp-glslang
	git config submodule.ext/lua.url ../ppsspp-lua
	git config submodule.ext/rcheevos.url ../rcheevos
	git config submodule.ext/SPIRV-Cross.url ../spirv-cross
	git config submodule.libretro/libretro-common.url ../libretro-common
	git -c protocol.file.allow=always submodule update
	sed -i 's/ext\/rapidjson\/include\/\(rapidjson\/document\.h\)/\1/' Core/RetroAchievements.cpp
	sed -i 's/\(miniupnpc\)\/include/\1/' Core/Util/PortManager.h
	sed -i '/libchdr/d' ext/CMakeLists.txt
}

build() {
	local options=(
		-B build
		-D ARMIPS_USE_STD_FILESYSTEM=ON
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_SKIP_RPATH=ON
		-D LIBRETRO=ON
		-D USE_SYSTEM_FFMPEG=ON
		-D USE_SYSTEM_LIBZIP=ON
		-D USE_SYSTEM_MINIUPNPC=ON
		-D USE_SYSTEM_SNAPPY=ON
		-D USE_SYSTEM_ZSTD=ON
		-W no-dev
	)
	cmake "${options[@]}" ppsspp
	cmake --build build
}

package() {
	depends+=(
		'libavcodec.so'
		'libavformat.so'
		'libavutil.so'
		'libchdr.so'
		'libgcc_s.so'
		'libGLEW.so'
		'libminiupnpc.so'
		'libOpenGL.so'
		'libpng16.so'
		'libsnappy.so'
		'libstdc++.so'
		'libswresample.so'
		'libswscale.so'
		'libzip.so'
		'libz.so'
		'libzstd.so'
	)

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/lib/ppsspp_libretro.so
}
