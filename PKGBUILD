# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=2.1.r297.g3bf817aea
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
	'vulkan-headers>=1:1.3.256'
	'vulkan-memory-allocator'
	'xbyak'
	'xxhash'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_reponame::git+$url.git"
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'ad0de164a518b93a684fc52be3b848719f80888f7fe89c1c64301aa312da8cf5a2951c4a735809d7ce39ea8f23d8b4e8d1ab88011827a2b1c63b8fd5afc3c943'
)

pkgver() {
	cd $_reponame
	git describe --long --tags | sed 's/^v//i;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_reponame
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
