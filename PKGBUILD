# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fbneo-git
pkgver=10597.9cd133255
pkgrel=1
pkgdesc="libretro FBNeo NEW implementation of Final Burn Alpha"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/FBNeo"
license=('custom:Non-commercial')
groups=('libretro')
provides=('libretro-fbneo')
conflicts=('libretro-fbneo')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')
replaces=('libretro-fbalpha-git')

_libname=fbneo_libretro
_gitname=FBNeo
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/src/burner/libretro"
  if [ ${CARCH:0:3} = arm ]; then params="USE_CYCLONE=1"; fi
  if [ ${CARCH} = i686 ] || [ ${CARCH} = x86_64 ]; then params="USE_X64_DRC=1"; fi
  make ${params}
}

package() {
  install -Dm644 "${_gitname}/src/burner/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
