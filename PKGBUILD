# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r619.7fc6101
pkgrel=1
epoch=2
pkgdesc="Sega Saturn core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libchdr' 'libgcc' 'libstdc++' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' Makefile
	# fix build
	sed -i 's/ libchdr)/ zlib&/' Makefile.common
}

build() {
	cd $_pkgname
	make LTO= SYSTEM_LIBCHDR=1
}

package() {
	depends+=('libchdr.so' 'libgcc_s.so' 'libstdc++.so' 'libz.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
