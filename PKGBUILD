# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-ess-git
pkgver=16.10.1.7372.081ce9c0
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
  printf "%s.%s.%s" $(awk '/defvar ess-version/ {print $3}' lisp/ess-custom.el|sed s+-beta++|tr -d \"|tr - .) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
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
