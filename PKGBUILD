# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-same-cdi
pkgname=$_pkgname-git
pkgver=r62.99c0ddd
pkgrel=1
pkgdesc="Philips CD-i core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/same_cdi"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libgl' 'libstdc++' 'python')
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
	sed -i '/^LDFLAGS.*:=/d' Makefile.libretro
	sed -i '/corestr\.h/a #include <cstdint>' src/lib/util/corestr.cpp
}

build() {
	cd $_pkgname
	make -f Makefile.libretro
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro same_cdi_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
