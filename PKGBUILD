# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r16923.479d7da85
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
	'libglvnd'
	'libpcap'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
options=('!lto')
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
	'359b8f6ac862ca402a0e967a1003d03c012014cf3c0c2a13ad27ddb5e918430f0694fe872bee2c56fa60b43ff5825690df27a83f5046fddfdbbec9e2f2154519'
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
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON \
		-DDISABLE_ADVANCE_SIMD=ON \
		-DLIBRETRO=ON \
		-DLTO_PCSX2_CORE=ON \
		-DUSE_SYSTEM_LIBS=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
