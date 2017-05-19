# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=spacemacs
_pkgmaintainer=syl20bnr
_pkgdestdirname=spacemacs-funcs
_versionprefix=v
pkgver=0.200.9
pkgrel=1
pkgdesc="Useful functions from the Spacemacs project"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("spacemacs-funcs.el"
	"$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('6e9f59ad05e6c1a96d3efc268a39999e95956480c4f42a122a305633e0b60837'
            '81e8fc56421e00405cba2d78f8b5e14b1d9e8e23803dcf43eb8e89b72273ea1b')
install=${pkgname}.install

build() {
  emacs -q --no-splash -batch -L . -f batch-byte-compile spacemacs-funcs.el

  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  shopt -s globstar
  shopt -s extglob
  emacs -q --no-splash -batch -L . -f batch-byte-compile core/**/*funcs*.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile layers/**/*funcs*.el
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"

  cp spacemacs-funcs.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"

  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  shopt -s globstar
  shopt -s extglob
  cp --parents core/**/*funcs*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  cp --parents layers/**/*funcs*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"

  find "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/" -type f -exec chmod 644 -- {} +
}
