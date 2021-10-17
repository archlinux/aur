# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r600.f90e099
pkgrel=1
pkgdesc="Sega Saturn core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git' 'libchdr')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'unbundle-libchdr.patch'
)
b2sums=(
	'SKIP'
	'b129230a6a3df8c1a5bdfabfe9e20a29297df33b1bfd6ad9ad2dc35e3dd28c9208a6c506869849fe928a7ec4c1f94cb1099651f44c65e99d9d86994b7db188b0'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch -d $_pkgname -Np1 < unbundle-libchdr.patch
}

build() {
	make -C $_pkgname
}

package() {
	depends+=('libchdr.so')
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
