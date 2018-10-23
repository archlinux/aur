# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ess-git
epoch=1
pkgver=18.10.1.8051.1c4253cb
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
source=("emacs-ess::git://github.com/emacs-ess/ESS.git" no-html.diff)
sha256sums=('SKIP'
            'eda5cc1256e8470b92986c701fb4a7a2ddda25ce631a521f19d63afdc3cebb4b')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s.%s" $(awk '/defvar ess-version/ {print $3}' lisp/ess-custom.el|sed s+-beta++|tr -d \"|tr - .) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/no-html.diff
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
