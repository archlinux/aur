# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r16875.7357bde45
pkgrel=2
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
	'libchdr'
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
	'git'
	'libgl'
	'libpcap'
	'libx11'
	'libxcb'
	'libxrandr'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git#branch=libretro"
	'glslang::git+https://github.com/KhronosGroup/glslang.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'e79cd9f3b05ad7de2f0ed366dacd2b230b973704724d77cc8fa72265b783ebb644f798b491f1d84b3923d180e173b8b7ce5fe394ac275c34bc701f182f60e780'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.3rdparty/glslang/glslang.url ../glslang
	git config submodule.3rdparty/vulkan-headers.url ../vulkan-headers
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
	sed -i '/ccache/d' CMakeLists.txt
	sed -i '/USE_GCC/s/AND CMAKE_INTERPROCEDURAL_OPTIMIZATION//' common/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON \
		-DDISABLE_ADVANCE_SIMD=ON \
		-DLIBRETRO=ON \
		-DUSE_SYSTEM_LIBS=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
