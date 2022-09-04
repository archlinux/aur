# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=2.0.r0.gaa97a6d6
pkgrel=1
pkgdesc="Sega Dreamcast core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
groups=('libretro')
depends=('libgl' 'libretro-core-info')
makedepends=(
	'cmake'
	'git'
	'glm'
	'libchdr'
	'libglvnd'
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
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'e958858e145819df2156856b55b441b960716403c140cf79c6bbec5fbfae06303e27ea42f9fa4d58250046c9700ac04e5d26feb6a469ea9cd9cdda4c471ad896'
)

pkgver() {
	cd $_reponame
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_reponame
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
		'libminiupnpc.so'
		'libxxhash.so'
		'libzip.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
