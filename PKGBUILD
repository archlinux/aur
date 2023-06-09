# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-snes9x
pkgname=$_pkgname-git
pkgver=r2448.46f8a6b7
pkgrel=1
pkgdesc="Super Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/snes9x"
license=('custom' 'GPL3' 'LGPL2.1')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info' 'zlib')
makedepends=('git')
provides=("$_pkgname=1:${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O3//' $_pkgname/libretro/Makefile
}

build() {
	make -C $_pkgname/libretro LTO=
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro libretro/snes9x_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
