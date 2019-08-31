# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-tic-80-git
pkgver=992.634f3e7
pkgrel=4
pkgdesc="TIC-80 is a fantasy computer for making, playing and sharing tiny games."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/TIC-80"
license=('GPL')
groups=('libretro')
makedepends=('git' 'cmake')

_libname=tic80_libretro
_gitname=TIC-80

source=("git+https://github.com/libretro/TIC-80.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"
  echo $(git submodule update --init --recursive)
}

build() {
  cd "${_gitname}/build"
  cmake .. -DBUILD_SDL=1 -DBUILD_SOKOL=0 -DBUILD_LIBRETRO=1
  make
}

package() {
  install -Dm644 "${_gitname}/build/lib/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}