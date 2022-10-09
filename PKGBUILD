# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=2.0.r58.g387b9778
pkgrel=1
pkgdesc="Sega Dreamcast core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info')
makedepends=(
	'cmake'
	'git'
	'glm'
	'glslang>=11.11'
	'libchdr'
	'libgl'
	'libzip'
	'miniupnpc'
	'xbyak'
	'xxhash'
	'zlib'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_reponame::git+$url.git"
	'Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'667b64dab77b80d6091028d28b1c13e1e8f70d352d7d7f4fecb7f54a5db604f741a85d1e2e26ddef6be4e401a4d33209b7d919521452d81b169bf268759e75c2'
)

pkgver() {
	cd $_reponame
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_reponame
	git config submodule.core/deps/Vulkan-Headers.url ../Vulkan-Headers
	git config submodule.core/deps/VulkanMemoryAllocator.url ../VulkanMemoryAllocator
	git submodule update
	patch -Np1 < ../unbundle-libs.patch
	rm -r core/deps/libretro-common/include/libchdr
}

build() {
	cmake -S $_reponame -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_BINDIR=lib/libretro \
		-DCMAKE_INSTALL_PREFIX=/usr \
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
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
