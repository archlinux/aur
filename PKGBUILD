# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=('emacs-opa-mode-git')
url="https://github.com/MLstate/opalang/"
license=('GPL')
pkgrel=1
pkgver=20121125
pkgdesc="Major mode for editing Opa-Classic and Opa-Js programs"
install=emacs-opa-mode-git.install
depends=('emacs')
makedepends=('emacs')
arch=('any')

_gitroot=http://github.com/MLstate/opalang.git
_gitname=opalang

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
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  
  # none
  cd "$srcdir/$_gitname-build/tools/editors/emacs"  
  emacs -batch -f batch-byte-compile *.el
}

package() {
  cd "$srcdir/$_gitname-build/tools/editors/emacs"

  install -d "$pkgdir/usr/share/emacs/site-lisp/opa"
  install -m644 *.el{,c} "$pkgdir/usr/share/emacs/site-lisp/opa/"
}

# vim:set ts=2 sw=2 et:
