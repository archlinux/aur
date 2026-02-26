# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Menelkir <menelkir@itroll.org>
_pkgname=libretro-beetle-lynx
pkgname=$_pkgname-git
pkgver=r779.efd1797
pkgrel=1
pkgdesc="Atari Lynx core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/beetle-lynx-libretro"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libstdc++')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' $_pkgname/Makefile
}

build() {
	make -C $_pkgname
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so')
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
