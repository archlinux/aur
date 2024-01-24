# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=2.2.r40.g07d6ca6c8
pkgrel=2
pkgdesc="Sega Dreamcast, NAOMI, NAOMI 2, Atomiswave and System SP core (fork of reicast)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info' 'spirv-tools')
makedepends=(
	'cmake'
	'git'
	'glm'
	'glslang'
	'libchdr'
	'libgl'
	'libzip'
	'miniupnpc'
	'vulkan-memory-allocator'
	'xbyak'
	'xxhash'
	'zlib'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'e8b3e8e08edcce3203e23aa632e4e3e0f4841eaac2580f0449cde9b40e5557ad3c17b215bbd4f6779be0c40e1bba6b8ab2c73096e4bb97611c850912e12f9e64'
)

pkgver() {
	cd flycast
	git describe --long --tags | sed 's/^v//i;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd flycast
	git config submodule.core/deps/Vulkan-Headers.url ../Vulkan-Headers
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
	rm -r core/deps/libretro-common/include/libchdr
	# https://github.com/KhronosGroup/glslang/pull/3487
	sed -i '/glslang REQUIRED/i find_package(SPIRV-Tools-opt)' CMakeLists.txt
}

build() {
	cmake -S flycast -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DLIBRETRO=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libchdr.so'
		'libGL.so'
		'libminiupnpc.so'
		'libxxhash.so'
		'libzip.so'
		'libz.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/flycast_libretro.so
}
