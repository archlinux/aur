# Maintainer:  Hugo Barrera <hugo@barrera.io>
# Contributor:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fbneo
_commit=752e4f94c
pkgver=1.0.0.02.r912.g752e4f94c
pkgrel=1
pkgdesc="libretro implementation of FinalBurn Neo"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/libretro/FBNeo"
license=('custom:Non-commercial')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
replaces=('libretro-fbalpha-git')

_libname=fbneo_libretro
_gitname=FBNeo
source=("git+https://github.com/libretro/${_gitname}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}/src/burner/libretro"

  make generate-files

  if [[ $CARCH == x86_64 ]]; then
        make USE_X64_DRC=1
  else
        make
  fi
}

package() {
  install -Dm644 "${srcdir}/${_gitname}/src/burner/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${srcdir}/${_gitname}/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
