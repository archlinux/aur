# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-bsnes
pkgname=$_pkgname-git
pkgver=r3214.d0a61b2c
pkgrel=1
pkgdesc="Super Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/bsnes-libretro"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libgomp' 'libstdc++')
provides=("$_pkgname=1:${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' nall/GNUmakefile
}

build() {
	cd $_pkgname
	export flags+=" $CXXFLAGS"
	export options+=" $LDFLAGS"
	make -C bsnes target=libretro binary=library local=false platform=linux
}

package() {
	depends+=('libgcc_s.so' 'libgomp.so' 'libstdc++.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro bsnes/out/bsnes_libretro.so
}
