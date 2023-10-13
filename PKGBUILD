# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=2.1.r415.g2a364dee6
pkgrel=1
pkgdesc="Sega Dreamcast, NAOMI, NAOMI 2, Atomiswave and System SP core (fork of reicast)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=(
	'cmake'
	'git'
	'glm'
	'glslang>=12.3.1'
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
	'596d28372f9b398604fae1a136839711d2f754ade4aa12f71d16016bf63e5b9b5e9b50c1d524aafbd1e75bbfc1a82a19e45901e22a76845eb960eb241c2518b6'
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
