# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r606.8351a17
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
	"$_pkgname-unbundle-libchdr.patch::$url/pull/210.patch"
)
b2sums=(
	'SKIP'
	'3750dd4a9a036c2e271744ea7aa772272fa256916e3a8a0465c03d930ca94b1a4744c1731211d07ad305c60142fccc2c3936af127dd3d6e84a59b43019ea8801'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../$_pkgname-unbundle-libchdr.patch
	sed -i 's/-O2//' Makefile
}

build() {
	make -C $_pkgname SYSTEM_LIBCHDR=1
}

package() {
	depends+=('libchdr.so')
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
