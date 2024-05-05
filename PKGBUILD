# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>

_distname=sudoku
_dist_owner=wimleers
pkgname="${_distname}-git"
pkgver=1.0.r2.g2489c02
pkgrel=4
pkgdesc="Sudoku app written in C++/Qt."
arch=('i686' 'x86_64')
url="https://wimleers.com/project/work/${_distname}"
_repourl="https://github.com/${_dist_owner}/${_distname}"
license=('Unlicense')
depends=(
  'gcc-libs'
  'glibc'
  'qt4'
)
makedepends=(
  'gendesk'
  'git'
)
provides=("${_distname}=${pkgver%.r*}")
conflicts=("${_distname}")
_clonedirname="${_distname}-${_dist_owner}"
source=("${_clonedirname}::git+${_repourl}.git")
b2sums=('SKIP')

prepare() {
  echo "Pathching to increase max difficulty level to 6..."
  sed -e 's/static int NumLevels(void) { return 5; }/static int NumLevels(void) { return 6; }/' \
      -i "${_clonedirname}/src/Sudoku.h"
  echo "Done."

  gendesk -n -f \
          --pkgname "${_distname}" \
          --pkgdesc "${pkgdesc}" \
          --name "Sudoku (Qt4)" \
          --icon "${_distname}-qt" \
          --genericname "Sudoku Game" \
          --exec "/usr/bin/${_distname} %u" \
          --categories "Game;Sudoku"
}

pkgver() {
  cd "${_clonedirname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${_clonedirname}/src"
  qmake-qt4 Sudoku_release.pro
  make
}

package() {
  cd "${_clonedirname}"
  install -Dm755 src/Sudoku "${pkgdir}/usr/bin/${_distname}"
  install -Dm644 "../${_distname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 src/resources/images/icon.png "${pkgdir}/usr/share/icons/${_distname}-qt.png"
}
