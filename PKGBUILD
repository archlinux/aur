# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.16
pkgrel=3
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'gnet' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-archlinux.patch")
sha256sums=('6fdcee22b3e9a76d44d8c3a582d068452290ec4c24f8f2f9e4498adf4daf40af'
            'af53095c0de32ee01cec8eeb8e34b722b206de5b5e13bf8553bf2cf91ef91bab')

prepare() {
  cd FreeDoko_$pkgver

  patch -p1 -i ../freedoko-archlinux.patch
  find manual -type f -exec chmod 644 {} \;
}

build() {
  cd FreeDoko_$pkgver

  CXXFLAGS+=' -Wno-deprecated'

  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 bin/FreeDoko.desktop "$pkgdir"/usr/share/applications/freedoko.desktop
  tar -c --exclude={*.sh,Makefile} manual | tar -x -C "$pkgdir"/usr/share/doc/freedoko
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows,de/SuSE,en/Windows,hpux*}
}
