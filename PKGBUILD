# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=2.4.r232.g44f77408e
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
	'xbyak'
	'xxhash'
	'zlib'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"flycast::git+$url.git"
	'flycast-asio::git+https://github.com/flyinghead/asio.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'4b57de8da10081212aa597c459d8e63a427d6b8b9001f0d9f34fa69e097f4179acf6ee437e605557985df682b076ef73b489c65cd8f5f9ea63dfda66df2d59f4'
)

pkgver() {
	cd flycast
	git describe --long --tags | sed 's/^v//i;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd flycast
	git config submodule.core/deps/asio.url ../flycast-asio
	git config submodule.core/deps/Vulkan-Headers.url ../vulkan-headers
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
	rm -r core/deps/libretro-common/include/libchdr
	sed -i '/ccache/d' CMakeLists.txt
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
