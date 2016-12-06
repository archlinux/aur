# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Maintainer: Sascha Pfau

_realname=CuteMarkEd
pkgname=cutemarked
pkgver=0.11.3
pkgrel=1
pkgdesc="Qt Markdown Editor"
url="https://github.com/cloose/CuteMarkEd"
arch=('i686' 'x86_64')
license=( "GPL2" )
depends=( "qt5-webkit" "hunspell" "discount>=2.1.7" )
makedepends=( 'qt5-tools' )
source=( "https://github.com/cloose/CuteMarkEd/archive/v$pkgver.tar.gz" )
sha256sums=('78a41808c2f0452375810abdff76eeaaee012f8d1368a2b8772ec6b4d2ceeec8')

prepare() {
  cd $srcdir/$_realname-$pkgver
  sed -i -e "s,#include <discount/mkdio.h>,#include <mkdio.h>,g" app-static/converter/discountmarkdownconverter.cpp
  # Fix: Add FencedCode option
  sed -i -e "s,unsigned long converterOptions = MKD_TOC | MKD_NOSTYLE;,unsigned long converterOptions = MKD_TOC | MKD_NOSTYLE | MKD_FENCEDCODE;,g" app-static/converter/discountmarkdownconverter.cpp
}

build() {
  cd $srcdir/$_realname-$pkgver
  qmake
  make || true #  the first make run might fail
  make
}
package() {
  cd $srcdir/$_realname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  mkdir -p "$pkgdir"/usr/bin
  #ln -s ../lib/qt/bin/cutemarked "$pkgdir"/usr/bin/cutemarked
}
