# Maintainer: LIN Rs <20455421+LinRs [dot] users.noreply.github.com>

pkgname=devilutionx-git
_pkgname=devilutionx
pkgver=0.3.1.r5.gf2e352fb
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('sdl2_mixer' 'sdl2_ttf' 'libsodium')
makedepends=('git' 'cmake' 'gcovr' 'nasm') 
provides=("${pkgname}")
source=(
  "${pkgname}::git+https://github.com/diasurgical/devilutionX.git"
  LICENSE::https://raw.githubusercontent.com/diasurgical/devilutionX/master/LICENSE
)
noextract=()
sha256sums=('SKIP'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')
pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname}"
  if [[ -d build ]]; then
    rm -rf build
  fi	
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr 
  make
}
package() {
  cd "${pkgname}"
  install -vDm755 build/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -vDm644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
