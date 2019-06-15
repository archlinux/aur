# Maintainer:  Kristian Buchman <kribuchman@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-mupen64plus-nx-git

_gitname=mupen64plus-libretro-nx
_libname=mupen64plus_next_libretro

pkgver=148.96608ba
pkgrel=1
pkgdesc="libretro port of Mupen64 Plus with GLideN64"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/mupen64plus-libretro-nx"
license=('GPL3')
groups=('libretro')
depends=('libglvnd' 'libpng')
makedepends=('git' 'nasm')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  	cd "${_gitname}"
  	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  	cd "${_gitname}"
	if [ ! -z "$(grep -i 'odroid' /proc/cpuinfo 2>/dev/null)" ]; then
		platform=odroid make WITH_DYNAREC=$CARCH
	elif [[ "$CARCH" == arm || "$CARCH" == armv6h || "$CARCH" == armv7h ]]; then
		platform=rpi make WITH_DYNAREC=$CARCH
	elif [ $CARCH == "i686" ]; then
		make WITH_DYNAREC=x86
	elif [ $CARCH == "x86_64" ]; then
		make WITH_DYNAREC=$CARCH
	fi
}

package() {
  	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
