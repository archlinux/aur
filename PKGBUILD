# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=2.1.r292.gdca048981
pkgrel=1
pkgdesc="Sega Dreamcast/NAOMI/NAOMI 2/Atomiswave core (fork of reicast)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info' 'zlib')
makedepends=(
	'cmake'
	'git'
	'glm'
	'glslang>=12.2'
	'libchdr'
	'libgl'
	'libzip'
	'miniupnpc'
	'vulkan-headers>=1:1.3.250'
	'vulkan-icd-loader'
	'xbyak'
	'xxhash'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_reponame::git+$url.git"
	'VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'c226d68266b6a1bd6e59f0c9d1e6ba5299945b2282673839c76d738d16c14e4e5e6a45b930d7ba8a14edbe1aa7c5ea053243895db6ccfca4ae1164008fe4334f'
)

pkgver() {
	cd $_reponame
	git describe --long --tags | sed 's/^v//i;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_reponame
	git config submodule.core/deps/VulkanMemoryAllocator.url ../VulkanMemoryAllocator
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
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
