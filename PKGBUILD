# Maintainer: LIN Rs <LinRs[d]users.noreply.github.com>

pkgbase=devilutionx-git
pkgname=( 'devilutionx-git' 'devilutionx-multilib-git' )
_pkgname=devilutionx
pkgver=0.5.0.r37.g3c416b16
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
makedepends=('git' 'cmake' 'lib32-gcc-libs' 'lib32-sdl2_mixer'
'sdl2_ttf' 'sdl2_ttf' 'lib32-sdl2_ttf'  'lib32-libsodium' 'libsodium')
#provides=("${pkgname}"="${pkgver}")
install="${_pkgname}".install
source=(
  "${_pkgname}::git+https://github.com/diasurgical/devilutionX.git"
  LICENSE::https://raw.githubusercontent.com/diasurgical/devilutionX/master/LICENSE
)
sha256sums=('SKIP'
	    '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  rm -rf build32 build64
  mkdir -p build64 && cd build64
  cmake ..
  make
  cd "${srcdir}/${_pkgname}"
  mkdir -p build32 && cd build32
  export CC="gcc -m32"
  export CXX="g++ -m32"
  cmake ..
##    -DCMAKE_TOOLCHAIN_FILE=../CMake/32bit.cmake
  make
}
package_devilutionx-git() {
  pkgdesc="Diablo devolved for linux (native build)"
  provides=("${_pkgname}"="${pkgver}")
  depends=('sdl2_mixer' 'sdl2_ttf' 'libsodium')
  makedepends=('git' 'cmake')
  cd "${_pkgname}"
  install -vDm755 build64/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}_native"
  install -vDm644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
package_devilutionx-multilib-git() {
  pkgdesc="Diablo devolved for linux (multilib build)"
  provides=("${_pkgname}"="${pkgver}")
  depends=('lib32-gcc-libs' 'lib32-sdl2_mixer' 'sdl2_ttf' 'lib32-sdl2_ttf'  'lib32-libsodium' 'libsodium')
  makedepends=('git' 'cmake')

  cd "${_pkgname}"
  install -vDm755 build32/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}_multilib"
  install -vDm644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
