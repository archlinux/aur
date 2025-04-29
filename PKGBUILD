# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r17006.5112943bb
pkgrel=2
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/pcsx2"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=(
	'gcc-libs'
	'glibc'
	'libretro-core-info'
)
makedepends=(
	'cmake'
	'fast_float'
	'fmt'
	'git'
	'libaio'
	'libchdr'
	'libglvnd'
	'libpcap'
	'libpng'
	'libzip'
	'rapidyaml'
	'systemd-libs'
	'xz'
	'zlib'
	'zstd'
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
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_DISABLE_PRECOMPILE_HEADERS=ON
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		-D DISABLE_ADVANCE_SIMD=ON
		-D LIBRETRO=ON
		-D LTO_PCSX2_CORE=ON
		-D USE_SYSTEM_LIBS=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=(
		'libaio.so'
		'libchdr.so'
		'libfmt.so'
		'liblzma.so'
		'libpng16.so'
		'libryml.so'
		'libudev.so'
		'libz.so'
		'libzip.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
