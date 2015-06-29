# Contributor: sumito3478 <sumito3478@gmail.com>
pkgname=emacs-scala-mode-git
pkgver=20150424
pkgrel=1
pkgdesc="Scala-mode for emacs, from the official Scala Github repository"
arch=('any')
url="https://github.com/scala/scala-tool-support/tree/master/tool-support/emacs"
license=('BSD')
depends=('emacs')
makedepends=('git')
provides=('emacs-scala-mode')
conflicts=('emacs-scala-mode')
install=install.sh

_gitroot="https://github.com/scala/scala-tool-support.git"
_gitname=scala-dist

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  cd "tool-support/emacs"
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  cd "tool-support/emacs"

  install -d -m755 ${pkgdir}/usr/share/emacs/scala-mode/ || return 1
  install -D -m644 *.elc ${pkgdir}/usr/share/emacs/scala-mode/ || return 1
}

# vim:set ts=2 sw=2 et:
