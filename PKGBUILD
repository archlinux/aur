# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
_pkgname=libretro-neocd
pkgname=$_pkgname-git
pkgver=r114.33b8f9c
pkgrel=1
pkgdesc="SNK Neo Geo CD core"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/neocd_libretro"
license=('LGPL3')
groups=('libretro')
depends=('gcc-libs' 'libchdr' 'libretro-core-info' 'libvorbis' 'minizip')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'f033a8315cc072510be10e39d7bd434f94b905d7c84e70ea526f27ed291b0b6657be27e0f12469bd987e7aefbc3c40a3fb95f222592b078128c0d50ab833419c'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../unbundle-libs.patch
	sed -i 's/-Ofast//g' Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/neocd_libretro.so
}
