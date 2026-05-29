# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-lrps2
pkgname=$_pkgname-git
pkgver=r19272.c08641f
pkgrel=1
pkgdesc="Sony PlayStation 2 core (fork of PCSX2)"
arch=('x86_64')
url="https://github.com/libretro/ps2"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=(
	'cmake'
	'fast_float'
	'git'
	'libgl'
	'libstdc++'
	'libzip'
	'rapidyaml>=0.11'
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
	"use-system-libs.patch"
)
b2sums=(
	'SKIP'{,,,,,}
	'1db2dda768337fdb7137824d145d526532c5ea6b09ce98569b648957871d79a68ec40d1623ecabcbfd2973349f63f378e55e0686aab3b25718febba41b77c0d8'
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
	patch -Np1 < ../use-system-libs.patch
	cd pcsx2/GS/parallel-gs
	git config submodule.Granite.url "$srcdir"/granite
	git -c protocol.file.allow=always submodule update
	cd Granite
	git config submodule.third_party/volk.url "$srcdir"/volk
	git -c protocol.file.allow=always submodule update
}

build() {
	local options=(
		-B build
		-D CCACHE_FOUND=OFF
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		# -D DISABLE_ADVANCE_SIMD=ON
		-D LTO_PCSX2_CORE=ON
		-D USE_SYSTEM_LIBS=ON
		-W no-dev
	)
	cmake "${options[@]}" $_pkgname
	cmake --build build
}

package() {
	depends+=(
		'libryml.so'
		'libstdc++.so'
		'libzip.so'
		'libzstd.so'
	)

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
