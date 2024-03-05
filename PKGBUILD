# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=2.2.r203.g960b8134c
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
	'Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'6ca2fdd4306571a59084ec208b29e50d79e84da5df1262004f713e8a95b3494f538b6c82315ff5e8eaf4c8aed0bdf34cb624535442759e5615bc892ebc775d61'
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
		'libminiupnpc.so'
		'libxxhash.so'
		'libzip.so'
		'libz.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/flycast_libretro.so
}
