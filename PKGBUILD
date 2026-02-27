# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r570.b4df47a
pkgrel=1
epoch=2
pkgdesc="Sega Saturn core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libchdr' 'libgcc' 'libstdc++')
provides=("$_pkgname")
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
	sed -Ei 's/-O([0123s]|fast)//' Makefile
}

build() {
	cd $_pkgname
	make SYSTEM_LIBCHDR=1
}

package() {
	depends+=('libchdr.so' 'libgcc_s.so' 'libstdc++.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
