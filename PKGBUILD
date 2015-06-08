# Maintainer: Stefan Husmann <stefan-husmann@t-online.de> 
# Contributors: SpepS, Guillem Rieu, Dan Serban

pkgname=textroom
pkgver=0.8.2
pkgrel=6
pkgdesc="Full Screen text editor heavily inspired by Q10 and JDarkRoom"
arch=('i686' 'x86_64')
url=http://code.google.com/p/textroom/
license=('GPL3')
depends=('curl' 'libxml++' 'hunspell' 'qt4' 'sdl_mixer')
makedepends=('mesa')
install='textroom.install'
source=("http://textroom.googlecode.com/files/$pkgname-${pkgver}.tar.gz" spell-check_patch)
md5sums=('e20bd19784644968bbffdb90d8ef0659'
         '3cd7541b37a0589e95d59581dfea2bdd')

prepare() {
  cd "$pkgname-${pkgver}"
  patch -p1 < "$srcdir"/spell-check_patch
}

build() {
  cd "$pkgname-${pkgver}"
  qmake-qt4
  sed 's+/usr/share/sounds+/usr/share/sounds/textroom+g' -i application/src/textroom.cpp
  sed 's+-lhunspell+-lhunspell-1.3+' -i Makefile -i application/application.pro
  sed 's/linux-g++/unix/' -i application/application.pro
  sed -i '19i#include <unistd.h>' library/sxfile/getusername.cpp
  make
}

package() {
  cd "$pkgname-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  rm "${pkgdir}"/usr/bin/textroom-uninstall
  install -Dm644 "${pkgdir}"/usr/share/sounds/keyenter.wav \
    "${pkgdir}"/usr/share/sounds/$pkgname/keyenter.wav
  install -Dm644 "${pkgdir}"/usr/share/sounds/keyany.wav \
    "${pkgdir}"/usr/share/sounds/$pkgname/keyany.wav
  rm "${pkgdir}"/usr/share/sounds/*.wav
  rm -rf "${pkgdir}"/usr/share/hunspell
}
