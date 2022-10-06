# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=2.0.r53.gd22fa54f
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
	'2f2edc320cd63737a9fcdfa90265a8003a576e3797b43291b44c567eb189253bb0b48c7a5e7bc5b36d89c2889a064ecbd9c0deac6d8df526289de8cd0e2349a8'
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
	cd $_reponame
	cmake -B ../build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_BINDIR=lib/libretro \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBRETRO=ON \
		-Wno-dev
	cmake --build ../build
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
