# Maintainer: Stefan Husmann <stefan-husmann@t-online.de> 
# Contributors: SpepS, Guillem Rieu, Dan Serban

pkgname=textroom
pkgver=0.8.2
pkgrel=7
pkgdesc="Full Screen text editor heavily inspired by Q10 and JDarkRoom"
arch=('i686' 'x86_64')
url=http://code.google.com/p/textroom/
license=('GPL3')
depends=('curl' 'libxml++' 'hunspell' 'qt4' 'sdl_mixer')
makedepends=('mesa')
install='textroom.install'
source=("http://textroom.googlecode.com/files/$pkgname-${pkgver}.tar.gz" spell-check_patch soundpath.patch getusername.patch libxml++.patch)
md5sums=('e20bd19784644968bbffdb90d8ef0659'
         '3cd7541b37a0589e95d59581dfea2bdd'
         '9cac5e18525ab54a7ef826916b4bc744'
         '2ea587d6ff2c3323e01075baa656aecc'
         '0c70b3895a4d6bf81661f228ca30cfa6')

prepare() {
  cd "$pkgname-${pkgver}"
  patch -p1 < "$srcdir"/spell-check_patch
  patch -p1 < "$srcdir"/soundpath.patch
  patch -p1 < "$srcdir"/getusername.patch
  patch -p1 < "$srcdir"/libxml++.patch
}

build() {
  cd "$pkgname-${pkgver}"
  qmake-qt4
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
