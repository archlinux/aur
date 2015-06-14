# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <lgsarmientop-ala-unal.edu.co>
pkgname=emacs-monky-git
pkgver=20130402
pkgrel=1
pkgdesc="Emacs extension that provides an interactive interface for mercurial hg"
url="http://ananthakumaran.in/monky/index.html"
arch=('any')
license=('unknown')
depends=('emacs')
makedepends=('git')
_gitroot="git://github.com/ananthakumaran/monky.git"
_gitname="monky"

build(){
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot #Shallow repo. --depth 1 nto possible
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
  cd ${srcdir}/$_gitname-build
  make
}

package(){
  cd ${srcdir}/$_gitname-build/ || return 1
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/monky || return 1
  cp -a ./* ${pkgdir}/usr/share/emacs/site-lisp/monky || return 1
}
