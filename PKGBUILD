# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=textroom-svn
pkgver=278
pkgrel=5
pkgdesc="Full Screen text editor heavily inspired by Q10 and JDarkRoom - svn-version "
arch=('i686' 'x86_64')
url="http://code.google.com/p/textroom/"
license=('GPL3')
depends=('curl' 'libxml++' 'hunspell' 'sdl_mixer')
makedepends=('subversion' 'mesa')
provides=('textroom')
conflicts=('textroom')
install=textroom.install
source=('textroom::svn+http://textroom.googlecode.com/svn/trunk' spell-check_patch)
md5sums=('SKIP'
         '3cd7541b37a0589e95d59581dfea2bdd')
_svnmod="textroom"

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$_svnmod"
  patch -p1 < "$srcdir"/spell-check_patch
}

build() {
  cd "$srcdir/$_svnmod"
  qmake-qt4
  sed 's+/usr/share/sounds+/usr/share/sounds/textroom+g' \
    -i application/src/textroom.cpp
  sed 's+-lhunspell +-lhunspell-1.3 +' -i Makefile -i \
    application/application.pro
  sed 's/linux-g++/unix/' -i application/application.pro
  sed -i '19i#include <unistd.h>' library/sxfile/getusername.cpp
  make
}

package() {
  cd "$srcdir/$_svnmod"
  make INSTALL_ROOT="${pkgdir}" install
  rm "${pkgdir}"/usr/bin/textroom-uninstall
  install -Dm644 "${pkgdir}"/usr/share/sounds/keyenter.wav \
    "${pkgdir}"/usr/share/sounds/textroom/keyenter.wav
  install -Dm644 "${pkgdir}"/usr/share/sounds/keyany.wav \
    "${pkgdir}"/usr/share/sounds/textroom/keyany.wav
  rm "${pkgdir}"/usr/share/sounds/*.wav
  rm -rf "${pkgdir}"/usr/share/hunspell
}
