# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-ess-git
pkgver=15.09.331.g9b1eb4f
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for \
 Statistical Analysis - git-version"
arch=('any')
url="http://ess.r-project.org"
license=('GPL')
depends=('emacs-julia-mode' 'r')
makedepends=('git')
provides=('ess' 'emacs-ess')
conflicts=('emacs-ess' 'emacs-ess-svn')
options=('docs' '!makeflags')
install=ess.install
source=("emacs-ess::git://github.com/emacs-ess/ESS.git")
md5sums=('SKIP')
_gitname="emacs-ess"

pkgver() {
  cd "$_gitname"
  git describe --tags | tr '-' '.' |cut -c2-
}

prepare() {
  cd "$_gitname/lisp"
  sed -i '67s+julia-mode.el++' Makefile
  cp /usr/share/emacs/site-lisp/julia-mode.el .
  cd ../doc
  sed -i 's+ text html pdf++' Makefile
  sed -i 's+install-other-docs++' Makefile
}

build() {
  cd "$srcdir/$_gitname"
  make prefix=/usr
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir/usr LISPDIR=$pkgdir/usr/share/emacs/site-lisp/ess \
    INFODIR=$pkgdir/usr/share/info/ install 
}
