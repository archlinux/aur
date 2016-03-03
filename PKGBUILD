# Maintainer: Tom <reztho@archlinux.org>
# Based on a contribution of: bitwave
pkgname=textadept
pkgver=8.6
pkgrel=1
pkgdesc="A fast, minimalist, and remarkably extensible cross-platform text editor"
arch=('i686' 'x86_64')
url="http://foicica.com/textadept/"
license=('MIT')
depends=('lua' 'gtk2')
makedepends=('mercurial' 'gendesk')
provides=("$pkgname")
conflicts=('textadept-bin')
replaces=('textadept-bin')
source=("hg+http://foicica.com/hg/textadept#revision=f27778cd1d49"
        'http://foicica.com/textadept/download/textadept_LATEST.modules.zip')

prepare() {
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
  cd "$srcdir/$pkgname/src"
  unset MAKEFLAGS
  unset CXXFLAGS
  unset CFLAGS
  make deps
  install -m644 "$srcdir/$pkgname/src/lua.sym" "$srcdir/$pkgname/src/luajit/src/lua.sym"
  make
  make curses
}

package() {
  cd "$srcdir/$pkgname/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  make curses PREFIX=/usr DESTDIR="$pkgdir/" install
  
  # Additional modules
  cd "$srcdir/${pkgname}_$pkgver.modules"
  cp -r modules "$pkgdir/usr/share/$pkgname/"

  # Icons
  rm "$pkgdir/usr/share/$pkgname/core/images/"{*.ico,*.icns}

  for res in 16 32 48 64 128 256; do
    install -d "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps"

    ln -s /usr/share/textadept/core/images/ta_${res}x${res}.png \
      "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
  done
  
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s /usr/share/$pkgname/core/images/$pkgname.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  
  # Desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # License
  install -d "$pkgdir/usr/share/licenses/textadept"
  ln -s /usr/share/textadept/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  
  # Documentation 
  install -d "$pkgdir/usr/share/doc"
  ln -s /usr/share/textadept/doc "$pkgdir/usr/share/doc/$pkgname"
}

md5sums=('SKIP'
         '5adecf21c7c91216bc85f43b329be380')
