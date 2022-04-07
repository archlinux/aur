# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-genesis-plus-gx-wide
pkgname=$_pkgname-git
pkgver=r1598.fa71a16
pkgrel=1
pkgdesc="Sega CD/Game Gear/Master System/Mega Drive/SG-1000 core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/Genesis-Plus-GX-Wide"
license=('custom')
groups=('libretro')
depends=('glibc' 'libchdr' 'libretro-core-info' 'libvorbis')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'e56f791aeaf8650e777985780db8990603d5fc164a0cb6fcfe00a9a0d459be754f15a34ce73ebbb5a8a82cb7fedac34608616f7b05d2ccb9dfca0660cf828a3e'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../unbundle-libs.patch
	sed -i 's/-O[0123s]//;s/-Ofast//' Makefile.libretro
}

build() {
	make -C $_pkgname -f Makefile.libretro SHARED_LIBVORBIS=1
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro genesis_plus_gx_wide_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.txt
}
