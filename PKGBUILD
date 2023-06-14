# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-bsnes
pkgname=$_pkgname-git
pkgver=r3093.4f4e22e8
pkgrel=1
pkgdesc="Super Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/bsnes-libretro"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
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
	sed -i 's/-O3//' $_pkgname/nall/GNUmakefile
}

build() {
	export flags+=" $CXXFLAGS"
	export options+=" $LDFLAGS"
	make -C $_pkgname/bsnes target=libretro binary=library local=false platform=linux
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/bsnes/out/bsnes_libretro.so
}
