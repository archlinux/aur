# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=2.5.r145.g82b4c55
pkgrel=1
pkgdesc="Sega Dreamcast, NAOMI, NAOMI 2, Atomiswave and System SP core (fork of reicast)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'glslang' 'libretro-core-info')
makedepends=(
	'cmake'
	'git'
	'glm'
	'libchdr'
	'libgl'
	'libzip'
	'miniupnpc'
	'vulkan-memory-allocator'
	'xxhash'
	'zlib'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"flycast::git+$url.git"
	'flycast-asio::git+https://github.com/flyinghead/asio.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'xbyak::git+https://github.com/herumi/xbyak.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'6c2c3778488cd4dcaa20e72b28a8bde05a9cc41e39e3bb4bcdb9d94a8a64a99d3be2afa00bd01e700a4238976b152d9f31d3982d913edc5f828cc771e560dc81'
)

pkgver() {
	cd flycast
	git describe --long --tags --abbrev=7 | sed 's/^v//i;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd flycast
	git config submodule.core/deps/asio.url ../flycast-asio
	git config submodule.core/deps/Vulkan-Headers.url ../vulkan-headers
	git config submodule.core/deps/xbyak.url ../xbyak
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
	rm -r core/deps/libretro-common/include/libchdr
	sed -i '/ccache/d' CMakeLists.txt
	sed -i '1i #include <cstddef>' core/network/miniupnp.cpp
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D LIBRETRO=ON
		-D USE_HOST_GLSLANG=ON
		-D USE_HOST_LIBCHDR=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S flycast
	cmake --build build
}

package() {
	depends+=(
		'libchdr.so'
		'libminiupnpc.so'
		'libxxhash.so'
		'libz.so'
		'libzip.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/flycast_libretro.so
}
