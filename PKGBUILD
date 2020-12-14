# Maintainer: Tom <reztho@archlinux.org>
# Based on a contribution of: bitwave
pkgname=textadept
pkgver=11.0
pkgrel=1
pkgdesc="A fast, minimalist, and remarkably extensible cross-platform text editor"
arch=('i686' 'x86_64')
url="http://foicica.com/textadept/"
license=('MIT')
depends=('lua' 'gtk2')
makedepends=('mercurial' 'wget' 'unzip')
provides=("$pkgname")
conflicts=('textadept-bin')
replaces=('textadept-bin')
source=("https://github.com/orbitalquark/textadept/archive/textadept_${pkgver}.tar.gz"
        "https://github.com/orbitalquark/textadept/releases/download/textadept_${pkgver}/textadept_${pkgver}.modules.zip")

build() {
  cd "$srcdir/textadept-textadept_${pkgver}/src"
  unset MAKEFLAGS
  unset CXXFLAGS
  unset CFLAGS
  make deps
  make
  make curses
}

package() {
  cd "$srcdir/textadept-textadept_${pkgver}/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
  make curses PREFIX=/usr DESTDIR="$pkgdir/" install
  
  # Additional modules
  cd "$srcdir/textadept-modules"
  cp -r ./* "$pkgdir/usr/share/$pkgname/"

  # License
  install -d "$pkgdir/usr/share/licenses/textadept"
  ln -s /usr/share/textadept/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  
  # Documentation 
  install -d "$pkgdir/usr/share/doc"
  ln -s /usr/share/textadept/doc "$pkgdir/usr/share/doc/$pkgname"
}

md5sums=('a57c070a8bb19687e819098ae190e836'
         'cacf22d1edf8a161578ca93b805a2035')
