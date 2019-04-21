# Maintainer: LinRs <LinRs AT users.noreply.github.com>
# Contributor: sballert <sballert@posteo.de>

_gituser="emacs-evil"
_gitrepo="evil"

pkgname=emacs-evil-git
pkgver=1.2.14.r3.g297b8f3
pkgrel=1
pkgdesc="The extensible vi layer for Emacs."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-undo-tree')
makedepends=('git')
provides=('emacs-evil')
conflicts=('emacs-evil')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
install="${_gituser}.install"
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitrepo}"
  make info
  make all
}

package() {
  cd "${srcdir}/${_gitrepo}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_gitrepo}"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_gitrepo}/"
  cd "${srcdir}/${_gitrepo}/doc"
  install -d "${pkgdir}/usr/share/info"
  install -m644 ${_gitrepo}.info "${pkgdir}/usr/share/info/"
}
