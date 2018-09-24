# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ess-git
pkgver=17.11.8000.820a7c51
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for \
 Statistical Analysis - git-version"
arch=('any')
url="http://ess.r-project.org"
license=('GPL')
depends=('emacs-julia-mode' 'r')
makedepends=('git' 'wget')
provides=('ess' 'emacs-ess')
conflicts=('emacs-ess' 'emacs-ess-svn')
options=('docs' '!makeflags')
install=ess.install
source=("emacs-ess::git://github.com/emacs-ess/ESS.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s.%s" $(awk '/defvar ess-version/ {print $3}' lisp/ess-custom.el|sed s+-beta++|tr -d \"|tr - .) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd ${pkgname%-git}/lisp
  sed -i 's+obsolete/++' Makefile
}

build() {
  cd ${pkgname%-git}
  make prefix=/usr
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir"/usr LISPDIR="$pkgdir"/usr/share/emacs/site-lisp/ess \
       INFODIR="$pkgdir"/usr/share/info/ install 
}
