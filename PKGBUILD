# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-ecwolf
pkgname=$_pkgname-git
pkgver=r1758.1c82ef9
pkgrel=1
pkgdesc="Wolfenstein 3D core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/ecwolf"
license=('BSD' 'LGPL')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'libretro-common::git+https://github.com/libretro/libretro-common.git'
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.src/libretro/libretro-common.url ../libretro-common
	git submodule update
}

build() {
	make -C $_pkgname/src/libretro
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro src/libretro/ecwolf_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname docs/license-{id,mame}.txt
}
