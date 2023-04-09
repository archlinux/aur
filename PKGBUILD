# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r16875.7357bde45
pkgrel=1
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/pcsx2"
license=('GPL3')
groups=('libretro')
depends=(
	'fmt'
	'gcc-libs'
	'glibc'
	'libaio'
	'libpng'
	'libretro-core-info'
	'libzip'
	'rapidyaml'
	'systemd-libs'
	'xz'
	'zlib'
	'zstd'
)
makedepends=(
	'cmake'
	'fast_float'
	'ffmpeg'
	'git'
	'sdl2'
	'soundtouch'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname" 'libretro-lrps2')
source=(
	"$_pkgname::git+$url.git#branch=libretro"
	'glslang::git+https://github.com/KhronosGroup/glslang.git'
	'libchdr::git+https://github.com/rtissera/libchdr.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.3rdparty/glslang/glslang.url ../glslang
	git config submodule.3rdparty/libchdr/libchdr.url ../libchdr
	git config submodule.3rdparty/vulkan-headers.url ../vulkan-headers
	git -c protocol.file.allow=always submodule update
	sed -i '/ccache/d' CMakeLists.txt
	sed -i '/USE_GCC/s/AND CMAKE_INTERPROCEDURAL_OPTIMIZATION//' common/CMakeLists.txt
	sed -i '/USE_SYSTEM_LIBS/s/OFF/ON/' cmake/BuildParameters.cmake
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DLIBRETRO=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
