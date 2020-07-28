# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sudoku-solver-git
_pkgname=sudoku-solver
pkgver=v1.0.0.r0.gb4bec10
pkgrel=1
pkgdesc='Contains several logical methods of solving, as well as brute force selection'
arch=('i686' 'x86_64')
url='https://bitbucket.org/admsasha/sudoku-solver'
license=('GPL3')
depends=('qt5-base')
provides=('sudoku-solver')
conflicts=('sudoku-solver')
makedepends=('qt5-base' 'git')
optdepends=('adwaita-icon-theme')
source=("${_pkgname}::git+https://bitbucket.org/admsasha/sudoku-solver")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  rm -rf build
  mkdir build
  cd build
  qmake PREFIX=/usr ..
  make 
}

package() {
  cd "${_pkgname}/build"
  install -Dm755 Bin/sudoku-solver -t "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/sudoku-solver"
  cp -avR langs/ "${pkgdir}/usr/share/sudoku-solver"
  cp -avR ../pkg/icons/ "${pkgdir}/usr/share/sudoku-solver"
  install -Dm644 ../pkg/sudoku-solver.desktop -t "${pkgdir}/usr/share/applications"
}
# vim:set ts=2 sw=2 et: