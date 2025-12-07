# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-lrps2
pkgname=$_pkgname-git
pkgver=r19147.14d19f8
pkgrel=1
pkgdesc="Sony PlayStation 2 core (fork of PCSX2)"
arch=('x86_64')
url="https://github.com/libretro/ps2"
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
	'fmt9'
	'git'
	'libgl'
	'libzip'
	'rapidyaml'
	'xz'
	'zstd'
)
provides=("$_pkgname=${pkgver#r}" 'libretro-pcsx2')
conflicts=("$_pkgname" 'libretro-pcsx2')
replaces=('libretro-pcsx2')
options=('!lto')
source=(
	"$_pkgname::git+$url.git"
	"glslang::git+https://github.com/KhronosGroup/glslang.git"
	"granite::git+https://github.com/Themaister/Granite.git"
	"parallel-gs::git+https://github.com/Arntzen-Software/parallel-gs.git"
	"volk::git+https://github.com/zeux/volk.git"
	"vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
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
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	# shellcheck disable=SC2154
	git config submodule.3rdparty/glslang/glslang.url "$srcdir"/glslang
	git config submodule.3rdparty/vulkan-headers.url "$srcdir"/vulkan-headers
	git config submodule.pcsx2/GS/parallel-gs.url "$srcdir"/parallel-gs
	git -c protocol.file.allow=always submodule update
	sed -i '/ccache/d' CMakeLists.txt
	sed -i '/fmt/s/7\.1\.3/&...<10/' cmake/SearchForStuff.cmake
	sed -i '/USE_SYSTEM_LIBS/d' cmake/BuildParameters.cmake
	sed -i 's|\.\./3rdparty/rapidyaml/rapidyaml/ext/c4core/src/c4/ext/fast_float/include/||' common/StringUtil.h
	sed -i 's|\.\./3rdparty/rapidyaml/rapidyaml/src/||' pcsx2/GameDatabase.cpp
	sed -i 's|\.\./3rdparty/fmt/fmt/include/||' common/HostSys.cpp
	cd pcsx2/GS/parallel-gs
	git config submodule.Granite.url "$srcdir"/granite
	git -c protocol.file.allow=always submodule update
	cd Granite
	git config submodule.third_party/volk.url "$srcdir"/volk
	git -c protocol.file.allow=always submodule update
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		# -D DISABLE_ADVANCE_SIMD=ON
		-D LTO_PCSX2_CORE=ON
		-D USE_SYSTEM_LIBS=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=(
		'libfmt.so'
		'libryml.so'
		'libzip.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
