# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Menelkir <menelkir@itroll.org>
# Contributor: Tomasz Paś <kierek93@gmail.com>
_pkgname=libretro-melonds
pkgname=$_pkgname-git
pkgver=r2014.c6488c88
pkgrel=1
epoch=1
pkgdesc="Nintendo DS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/melonDS"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git' 'libgl')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O[0123s]//;s/-Ofast//' $_pkgname/Makefile
}

build() {
	# https://github.com/Arisotura/melonDS/issues/1103
	# LDFLAGS+=" -Wl,-z,noexecstack"
	make -C $_pkgname
}

package() {
	depends+=('libGL.so')
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/melonds_libretro.so
}
