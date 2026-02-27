# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
_pkgname=libretro-mesen
pkgname=$_pkgname-git
pkgver=0.9.9.r338.g791c5e8
pkgrel=1
pkgdesc="Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.mesen.ca/"
license=('GPL-3.0-only')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libstdc++')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/libretro/Mesen.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' Libretro/Makefile
}

build() {
	cd $_pkgname
	make -C Libretro LTO=
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro Libretro/mesen_libretro.so
}
