# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=1.2.r245.g514eedbc
pkgrel=1
pkgdesc="Sega Dreamcast core"
arch=('i686' 'x86_64')
url="https://github.com/flyinghead/$_reponame"
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
	"git+$url.git"
	"$_pkgname-unbundle-libs.patch"
)
b2sums=(
	'SKIP'
	'602341ffaabf36382565ce780b88419feb6bf46ec7e2600631ead6a65c6d07edbdfbaea8c99ae9e53b85d260370eda0c06142b8b3149468508c4ad592a247a8d'
)

pkgver() {
	cd $_reponame
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_reponame
	patch -Np1 < ../$_pkgname-unbundle-libs.patch
	rm -r core/deps/libretro-common/include/libchdr
}

build() {
	cd $_reponame
	cmake -B ../build \
		-DCMAKE_BUILD_TYPE=None \
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
