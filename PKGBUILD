# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: sballert <sballert@posteo.de>

_gituser="emacs-evil"
_gitrepo="evil"

pkgname=emacs-evil-git
pkgver=1.14.0.r94.gee6f4bd
pkgrel=1
pkgdesc="The extensible vi layer for Emacs."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-undo-tree')
makedepends=('python-sphinx')
provides=('emacs-evil')
conflicts=('emacs-evil')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
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
  cd "${srcdir}/${_gitrepo}/doc/build/texinfo"
  install -d "${pkgdir}/usr/share/info"
  install -m644 ${_gitrepo}.info "${pkgdir}/usr/share/info/"
}
