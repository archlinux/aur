# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=r4457.8e4fa54e
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=('i686' 'x86_64')
url="https://github.com/libretro/flycast"
license=('GPL2')
groups=('libretro')
depends=('libgl' 'libretro-core-info' 'libzip' 'xxhash' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -E 's/^(\s*(CFLAGS|CXXFLAGS|LDFLAGS)\s*):=/\1+=/' -i $_pkgname/Makefile
}

build() {
	make -C $_pkgname \
		HAVE_OIT=1 \
		SYSTEM_LIBZIP=1 \
		SYSTEM_XXHASH=1 \
		SYSTEM_ZLIB=1
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/flycast_libretro.so
}
