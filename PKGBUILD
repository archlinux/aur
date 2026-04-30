# Maintainer: Axium <AxiumIxane@protonmail.com>

pkgname=emacs-compat
_pkgname=compat
pkgver=30.1.0.1
pkgrel=1
pkgdesc='Emacs Lisp compatibility library'
arch=('any')
url='https://github.com/emacs-compat/compat'
license=('GPL-3.0-or-later')
depends=('emacs')
source=("${pkgname}-${pkgver}.tar::https://elpa.gnu.org/packages/${_pkgname}-${pkgver}.tar")
sha256sums=('16fef8c2e47398ed1575898a9639d5659986a67ee11477726e878298c08945e6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for file in *.el; do
    [[ "$file" == *-pkg.el ]] && continue
    emacs -Q --batch -L . -f batch-byte-compile "$file"
  done
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  emacs -Q --batch -L . --eval "(require 'compat)"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp"

  shopt -s nullglob
  install -m644 *.el *.elc "${pkgdir}/usr/share/emacs/site-lisp/"
}
