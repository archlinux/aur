# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=openboard-develop
pkgver=1.3.4
pkgrel=1
pkgdesc="Interactive whiteboard software for schools and universities"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-script' 'qt5-webkit' 'libpaper' 'bzip2')
source=("https://github.com/OpenBoard-org/OpenBoard/archive/v$pkgver.tar.gz"
        "https://github.com/OpenBoard-org/OpenBoard-ThirdParty/archive/master.zip"
        "std-abs.patch")
md5sums=('a7dfe30d25de9285307fdab8c9b9aa20'
         'fa1ff089f0bcc15d2a510bb90cdd3002'
         '32689b48f23d7f513f6172c10c93aa00')

prepare() {
  mv "$srcdir/OpenBoard-ThirdParty-master" "$srcdir/OpenBoard-ThirdParty"

  cd "$srcdir/OpenBoard-$pkgver"
  patch -p1 < "$srcdir/std-abs.patch"
}

build() {
  cd "$srcdir/OpenBoard-ThirdParty"
  
  cd freetype
  qmake freetype.pro -spec linux-g++
  make
  cd ..

  cd quazip
  qmake quazip.pro -spec linux-g++
  make
  cd ..

  cd xpdf/xpdf-3.04
  ./configure --with-freetype2-library="../../freetype/lib/linux" --with-freetype2-includes="../../freetype/freetype-2.6.1/include"
  cd ..
  qmake xpdf.pro -spec linux-g++
  make
  cd ..

  cd "$srcdir/OpenBoard-$pkgver"
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir/OpenBoard-$pkgver"
  mkdir -p $pkgdir/usr/bin
  cp -rp build/linux/release/product/OpenBoard $pkgdir/usr/bin/
}
