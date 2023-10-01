# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=2.1.r384.ge8e382372
pkgrel=1
pkgdesc="Sega Dreamcast/NAOMI/NAOMI 2/Atomiswave core (fork of reicast)"
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
	'a0de47f7f43450f50f993e891ae74ebad433ef52559e24751ba83e58706699da0ab0a6b7631bf8c5dd5f13a687a163ad3daa64049771fad09045721bc7b993df'
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
