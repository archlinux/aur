# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fbalpha-git
pkgver=228.c4c9fb5
pkgrel=1
pkgdesc="libretro implementation of Final Burn Alpha (Arcade)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/fbalpha"
license=('custom:Non-commercial')
groups=('libretro')
makedepends=('git')

_libname=fbalpha_libretro
_gitname=fbalpha
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  RPI=`grep -m1 'Revision' /proc/cpuinfo | awk '{print $3}'`
  case "${RPI}" in
    a[0-2]1041)	PLATFORM="platform=rpi2" ;;
    a[0-2]2082)	PLATFORM="platform=rpi3" ;;
  esac
  cd "${_gitname}"
  make -f makefile.libretro ${PLATFORM}
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
  install -Dm644 "${_gitname}/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
