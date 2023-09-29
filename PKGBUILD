# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-ppsspp
pkgname=$_pkgname-git
pkgver=1.16.5.r34.gdea038a91b
pkgrel=2
pkgdesc="Sony PlayStation Portable core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.ppsspp.org/"
license=('GPL2')
groups=('libretro')
depends=(
	'gcc-libs'
	'glibc'
	'libretro-core-info'
	'snappy'
)
makedepends=(
	'cmake'
	'ffmpeg4.4' # https://github.com/hrydgard/ppsspp/issues/15308
	'git'
	'glew'
	'libchdr'
	'libgl'
	'libpng'
	'libzip'
	'miniupnpc'
	'python'
	'rapidjson'
	'zlib'
	'zstd'
)
optdepends=('ppsspp-assets')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	'ppsspp::git+https://github.com/hrydgard/ppsspp.git'
	'armips::git+https://github.com/Kingcom/armips.git'
	'cpu_features::git+https://github.com/google/cpu_features.git'
	'glslang::git+https://github.com/KhronosGroup/glslang.git'
	'rcheevos::git+https://github.com/RetroAchievements/rcheevos.git'
	'spirv-cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd ppsspp
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ppsspp
	git config submodule.cpu_features.url ../cpu_features
	git config submodule.ext/armips.url ../armips
	git config submodule.ext/glslang.url ../glslang
	git config submodule.ext/rcheevos.url ../rcheevos
	git config submodule.ext/SPIRV-Cross.url ../spirv-cross
	git -c protocol.file.allow=always submodule update
	sed -i 's/ext\/rapidjson\/include\/\(rapidjson\/document\.h\)/\1/' Core/RetroAchievements.cpp
	sed -i '/libchdr/d' ext/CMakeLists.txt
}

build() {
	export FFMPEG_DIR="/usr/include/ffmpeg4.4;/usr/lib/ffmpeg4.4"
	cmake -S ppsspp -B build \
		-DARMIPS_USE_STD_FILESYSTEM=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_SKIP_RPATH=ON \
		-DLIBRETRO=ON \
		-DUSE_SYSTEM_FFMPEG=ON \
		-DUSE_SYSTEM_LIBZIP=ON \
		-DUSE_SYSTEM_MINIUPNPC=ON \
		-DUSE_SYSTEM_SNAPPY=ON \
		-DUSE_SYSTEM_ZSTD=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libavcodec.so'
		'libavformat.so'
		'libavutil.so'
		'libchdr.so'
		'libGLEW.so'
		'libminiupnpc.so'
		'libOpenGL.so'
		'libpng16.so'
		'libswresample.so'
		'libswscale.so'
		'libzip.so'
		'libz.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/lib/ppsspp_libretro.so
}
