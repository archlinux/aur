# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Kristian Buchman <kribuchman@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
_pkgname=libretro-mupen64plus-next
pkgname=$_pkgname-git
pkgver=r411.26e306ac
pkgrel=1
pkgdesc="Nintendo 64 core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/mupen64plus-libretro-nx"
license=('GPL2')
groups=('libretro')
depends=('libgl' 'libpng' 'libretro-core-info')
makedepends=('git' 'libglvnd' 'minizip' 'nasm' 'xxhash' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('libretro-mupen64plus-nx-git')
options=('!lto') # https://github.com/libretro/mupen64plus-libretro-nx/issues/359
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# use makepkg.conf optimization flag
	sed -i 's/-O3//g' $_pkgname/Makefile
}

build() {
	make -C $_pkgname \
		HAVE_PARALLEL_RDP=1 \
		HAVE_PARALLEL_RSP=1 \
		HAVE_THR_AL=1 \
		LLE=1 \
		SYSTEM_LIBPNG=1 \
		SYSTEM_MINIZIP=1 \
		SYSTEM_XXHASH=1 \
		SYSTEM_ZLIB=1
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/mupen64plus_next_libretro.so
}
