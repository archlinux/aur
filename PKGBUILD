# Maintainer: Stefan Husmann <stefan-husmann@t-online.de> 
# Contributors: SpepS, Guillem Rieu, Dan Serban
# Maintainer: Holger Rauch

pkgname=textroom
pkgver=0.8.2
pkgrel=11
pkgdesc="Full Screen text editor heavily inspired by Q10 and JDarkRoom"
arch=('i686' 'x86_64')
url=http://code.google.com/p/textroom/
license=('GPL3')
depends=('curl' 'libxml++2.6' 'hunspell' 'qt4' 'sdl_mixer')
makedepends=('mesa')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-${pkgver}.tar.gz" spell-check_patch soundpath.patch getusername.patch libstd.patch)
md5sums=('e20bd19784644968bbffdb90d8ef0659'
         '3cd7541b37a0589e95d59581dfea2bdd'
         '9cac5e18525ab54a7ef826916b4bc744'
         '2ea587d6ff2c3323e01075baa656aecc'
         '6dabbba77624576739454ebdd1252472')
options=('!makeflags')

prepare() {
  cd "$pkgname-${pkgver}"
  patch -p1 < "$srcdir"/spell-check_patch
  patch -p1 < "$srcdir"/soundpath.patch
  patch -p1 < "$srcdir"/getusername.patch
  patch -p1 < "$srcdir"/libstd.patch
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
