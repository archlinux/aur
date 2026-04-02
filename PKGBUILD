# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Kristian Buchman <kribuchman@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
_pkgname=libretro-mupen64plus-next
pkgname=$_pkgname-git
pkgver=r536.58b9daf
pkgrel=1
pkgdesc="Nintendo 64 core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/mupen64plus-libretro-nx"
license=('GPL-2.0-only')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=(
	'git'
	'libgcc'
	'libgl'
	'libpng'
	'libstdc++'
	'minizip'
	'nasm'
	'xxhash'
	'zlib'
)
provides=("$_pkgname=1:${pkgver#r}")
conflicts=("$_pkgname")
replaces=('libretro-mupen64plus-nx-git')
options=('!lto') # https://github.com/libretro/mupen64plus-libretro-nx/issues/359
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
	# use system minizip
	sed -Ei 's/(un)?zip\.h/minizip\/&/' mupen64plus-core/src/main/savestates.c
}

build() {
	cd $_pkgname
	make \
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
	depends+=(
		'libgcc_s.so'
		'libGL.so'
		'libpng16.so'
		'libstdc++.so'
		'libz.so'
	)

	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro mupen64plus_next_libretro.so
}
