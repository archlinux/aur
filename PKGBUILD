# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
_pkgname=libretro-neocd
pkgname=$_pkgname-git
pkgver=r135.327aece
pkgrel=1
pkgdesc="SNK Neo Geo CD core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/neocd_libretro"
license=('LGPL3')
groups=('libretro')
depends=('gcc-libs' 'libchdr' 'libretro-core-info' 'libvorbis' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'de8c8053444f1dff288ee28f2e28eeee99900b5e90d03598f8b4ebf993707ee27c65ca7b8854abcac06ab356987b90586de9277d774a3557b0641fe995fe036c'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	mv deps/{libchdr/include/dr_libs,}
	patch -Np1 < ../unbundle-libs.patch
	sed -i 's/-Ofast//' Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/neocd_libretro.so
}
