# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_reponame=flycast
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=1.3.r81.gaa6c9e21
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
	'ad99c975bdfdeb6592a0496ac3e90665dda539de610003131dcaa98c4acf000e9b8c2a5b8567710dee6bd9710289e5b6081fef24f202d7e70955e56f1074e9a5'
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
