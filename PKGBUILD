# Maintainer: xywei <wxy0516@gmail.com>
# Contributor: csllbr

_pkgname=orgmk
pkgname=orgmk-git
pkgver=r81.a24a1c1
pkgrel=1
pkgdesc='Export Org mode documents to HTML, PDF, etc.'
url='https://github.com/fniessen/orgmk'
license=('GPL')
source=('git+https://github.com/fniessen/orgmk.git')
sha256sums=('SKIP')
arch=('any')
depends=('emacs')
makedepends=('git')
provides=('orgmk')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Fix PWD for sources of symlinks, made portable with relative paths
  sed -i '/PWD=\$(shell\ pwd)/c\PWD=..\/share\/orgmk' Makefile

  # Fix ORGMK_ROOT which gets hard-coded into emacs-lisp scripts
  sed -i '/ORGMK_ROOT=\$(PWD)/c\ORGMK_ROOT=\/usr\/share\/orgmk' Makefile

  # Fix BIN_DIR for destinations of symlinks
  sed -i '/BIN_DIR=\/usr\/local\/bin/c\BIN_DIR=\${DESTDIR}\/usr\/bin' Makefile
}

package() {
  mkdir -p "${pkgdir}"/usr/share/orgmk/
  mkdir -p "${pkgdir}"/usr/bin/

  cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}"/usr/share/orgmk/

  cd "${pkgdir}"/usr/share/orgmk

  make DESTDIR="${pkgdir}"
  make DESTDIR="${pkgdir}" install
}
