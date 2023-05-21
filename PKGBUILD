# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-ppsspp
pkgname=$_pkgname-git
pkgver=1.15.3.r54.g30b11e8ada
pkgrel=1
pkgdesc="Sony PlayStation Portable core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.ppsspp.org/"
license=('GPL2')
groups=('libretro')
depends=(
	'gcc-libs'
	'glibc'
	'libpng'
	'libretro-core-info'
	'snappy'
	'zlib'
)
makedepends=(
	'cmake'
	'ffmpeg4.4' # https://github.com/hrydgard/ppsspp/issues/15308
	'git'
	'glew'
	'libgl'
	'libzip'
	'miniupnpc'
	'python'
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
	'SPIRV-Cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git'
)
b2sums=(
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
	git config submodule.ext/SPIRV-Cross.url ../SPIRV-Cross
	git -c protocol.file.allow=always submodule update
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
		'libGLEW.so'
		'libminiupnpc.so'
		'libOpenGL.so'
		'libswresample.so'
		'libswscale.so'
		'libzip.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/lib/ppsspp_libretro.so
}
