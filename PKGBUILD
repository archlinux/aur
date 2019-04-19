# Maintainer: Tom <reztho@archlinux.org>
# Based on a contribution of: bitwave
pkgname=textadept
pkgver=10.3
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
source=("hg+http://foicica.com/hg/textadept#revision=e7c3dfab62a7"
        "http://foicica.com/textadept/download/textadept_${pkgver}.modules.zip")

build() {
  msg ""
  msg "If textadept can't be compiled try the following things in this order:"
  msg "- Run: hg config -e , and then add these lines:"
  msg "[hostsecurity]"
  msg "foicica.com:minimumprotocol = tls1.0"
  msg ""
  msg "- Run makepkg with the -C argument"
  msg ""
  cd "$srcdir/$pkgname/src"
  unset MAKEFLAGS
  unset CXXFLAGS
  unset CFLAGS
  make deps
  make
  make curses
}

package() {
  cd "$srcdir/$pkgname/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
  make curses PREFIX=/usr DESTDIR="$pkgdir/" install
  
  # Additional modules
  cd "$srcdir/${pkgname}_$pkgver.modules"
  cp -r modules "$pkgdir/usr/share/$pkgname/"

  # License
  install -d "$pkgdir/usr/share/licenses/textadept"
  ln -s /usr/share/textadept/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  
  # Documentation 
  install -d "$pkgdir/usr/share/doc"
  ln -s /usr/share/textadept/doc "$pkgdir/usr/share/doc/$pkgname"
}

md5sums=('SKIP'
         'e8e2b0c5323fafb9802969f207ce5ff6')
