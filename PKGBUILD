# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=r4174.0f29d7e1
pkgrel=1
pkgdesc='A multi-platform Sega Dreamcast emulator'
arch=('x86_64' 'i686')
url="https://github.com/libretro/flycast"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info' 'libgl' 'libzip' 'xxhash' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	sed -E 's/^((LDFLAGS|CFLAGS|CXXFLAGS)\s*):=/\1?=/' -i Makefile
}

build() {
	cd $_pkgname
	make HAVE_OIT=1 SYSTEM_LIBZIP=1 SYSTEM_XXHASH=1 SYSTEM_ZLIB=1
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro flycast_libretro.so
}
