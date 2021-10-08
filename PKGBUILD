# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-flycast
pkgname=$_pkgname-git
pkgver=r4464.4a913e06
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=('i686' 'x86_64')
url="https://github.com/libretro/flycast"
license=('GPL2')
groups=('libretro')
depends=('libchdr' 'libgl' 'libretro-core-info' 'libzip' 'xxhash')
makedepends=('git' 'libglvnd' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto') # https://github.com/libretro/flycast/issues/892
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

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
		SYSTEM_LIBCHDR=1 \
		SYSTEM_LIBZIP=1 \
		SYSTEM_XXHASH=1 \
		SYSTEM_ZLIB=1
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/flycast_libretro.so
}
