# $Id: PKGBUILD 88007 2013-04-09 21:47:55Z eric $
# Maintainer: AppleBloom <rat.o.drat@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: red_over_blue,Ben <ben@benmazer.net>,Kritoke <kritoke@gamebox.net>

pkgname=qscintilla-qt3
pkgver=1.7.1
pkgrel=6
pkgdesc="A port to Qt3 of Neil Hodgson's Scintilla C++ editor class"
arch=('i686' 'x86_64')
url="http://www.riverbankcomputing.co.uk/software/qscintilla/intro/"
license=('GPL2')
depends=('qt3')
source=("http://downloads.sourceforge.net/pyqt/QScintilla-1.71-gpl-$pkgver.tar.gz"
        "pro.patch")
md5sums=('dfa047b45d4f09ae8d4a8a431ba88a5a'
         '30b7f6bd33f73679872ab2a95c32baba')

_dir="QScintilla-1.71-gpl-$pkgver/qt"

prepare() {
  cd "$_dir"
  patch -p1 -i ../../pro.patch
}

build() {
  cd "$_dir"
  qmake-qt3 qscintilla.pro
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3
}

package() {
  cd "$_dir"
  # These need to be copied by hand, 
  # because make install doesn't
  # do it.
  dlib=`grep 'TARGETD\s=' Makefile | sed 's/.*=\s*\(.*\)/\1/'`
  sym0=`grep 'TARGET0\s=' Makefile | sed 's/.*=\s*\(.*\)/\1/'`
  sym1=`grep 'TARGET1\s=' Makefile | sed 's/.*=\s*\(.*\)/\1/'`
  sym2=`grep 'TARGET2\s=' Makefile | sed 's/.*=\s*\(.*\)/\1/'`
  
  install -Dm755 "$dlib" "$pkgdir"/usr/lib/"$dlib"
  ln -sr "$pkgdir"/usr/lib/"$dlib" "$pkgdir"/usr/lib/"$sym0"
  ln -sr "$pkgdir"/usr/lib/"$dlib" "$pkgdir"/usr/lib/"$sym1"
  ln -sr "$pkgdir"/usr/lib/"$dlib" "$pkgdir"/usr/lib/"$sym2"
  
  make INSTALL_ROOT="$pkgdir" MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 install
}
