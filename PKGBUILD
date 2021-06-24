# Maintainer:  Oliver Jaksch <arch-aur at com-in dot de>

pkgname=libretro-mame2000-git
pkgver=235.49671d5
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of 2000 version of MAME (0.37b5) (Arcade)"
url="https://github.com/libretro/mame2000-libretro"
license=('custom:MAME License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'python2')

_libname=mame2000_libretro
_gitname=mame2000-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/mame/master/docs/LICENSE")
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  case ${CARCH} in
    arm|armv6h|armv7h) makeargs="USE_CYCLONE=1" ;;
    aarch64) makeargs="IS_X86=0" ;;
  esac
  make -f Makefile ${makeargs}
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
