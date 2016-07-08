# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2014-git
pkgver=35008.6d370c1
pkgrel=3
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of late 2014/early 2015 version of MAME (0.159-ish) (Arcade)"
url="https://github.com/libretro/mame2014-libretro"
license=('custom:MAME License')
makedepends=('git' 'python2')

_libname=mame2014_libretro
_gitname=mame2014
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info"
	"gcc6-fix.patch")
sha256sums=('SKIP'
	'SKIP'
	'41a9099a0ee79cd7c8884dd45ebca6b6f9a175c057a7b00e852173a9199e6cc4')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  # quick hack to fix compiling with gcc >=6
  # https://github.com/libretro/mame2014-libretro/issues/10
  if [ `gcc -dumpversion | cut -b1` -gt 5 ]; then
    echo "gcc-6.x detected..applying fix"
    patch -p0 < "${srcdir}/gcc6-fix.patch"
  fi
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
  install -Dm644 "${_gitname}/docs/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
