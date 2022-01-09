# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
_pkgname=libretro-neocd
pkgname=$_pkgname-git
pkgver=r116.83d10f3
pkgrel=1
pkgdesc="SNK Neo Geo CD core"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/neocd_libretro"
license=('LGPL3')
groups=('libretro')
depends=('gcc-libs' 'libchdr' 'libretro-core-info' 'libvorbis' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	"$_pkgname-unbundle-libs.patch"
)
b2sums=(
	'SKIP'
	'4eed1c8a3c3d301ab1db5bc3aa0464d654cb948c71e84fb79912906a2085c5ef258fccfee10f83e1a1979fd5098f4f903f1f5928a3c885601e067152cda761e9'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../$_pkgname-unbundle-libs.patch
	sed -i 's/-Ofast//' Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/neocd_libretro.so
}
