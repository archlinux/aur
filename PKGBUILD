# Maintainer: Tom <reztho@archlinux.org>
# Based on a contribution of: bitwave
pkgname=textadept
pkgver=11.1
pkgrel=2
pkgdesc="A fast, minimalist, and remarkably extensible cross-platform text editor"
arch=('i686' 'x86_64' 'aarch64')
url="http://foicica.com/textadept/"
license=('MIT')
depends=('lua' 'gtk2')
makedepends=('wget' 'unzip')
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
  ln -s /usr/share/textadept/docs "$pkgdir/usr/share/doc/$pkgname"
}

md5sums=('ddf9350e5d29665dc18c115b536f4e51'
         'd064d0758bb8a57f0afb8f7bd99e1bbc')
