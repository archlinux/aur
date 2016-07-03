# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=qtmotifextension
pkgver=2.7
pkgrel=1
pkgdesc="Compatibility library for porting Motif to Qt"
arch=('i686' 'x86_64')
url="https://doc.qt.io/archives/3.3/motif-extension.html"
license=('GPL')

depends=('qt4' 'libxt' 'libx11')
#optdepends=('')
makedepends=('qt4' 'libxt' 'libx11' 'git')

source=('git://github.com/staalmannen/qtmotifextension.git#branch=qt4')

sha256sums=('SKIP')

options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')

prepare() {
  cd "$srcdir"/qtmotifextension
  echo "SOLUTIONS_LIBRARY = yes" > config.pri
  cd buildlib
  qmake-qt4 QTMOTIFEXTENSION_LIBDIR=/usr/lib/qt4
}

build() {
  cd "$srcdir"/qtmotifextension/buildlib
  make INSTALL_ROOT="$pkgdir"
}


package() {
  msg "installing..."
  cd "$srcdir"/qtmotifextension
  mkdir -p "$pkgdir"/usr/lib
  cp lib/* "$pkgdir"/usr/lib
  mkdir -p "$pkgdir"/usr/include/qt4/QtMotifextension
  cp src/*.h "$pkgdir"/usr/include/qt4/QtMotifextension/
  mkdir -p "$pkgdir"/usr/share/qt4/mkspecs
  cp src/qtmotifextension.pri "$pkgdir"/usr/share/qt4/mkspecs/
  sed 's|include(..\/common.pri)||g' -i "$pkgdir"/usr/share/qt4/mkspecs/qtmotifextension.pri
  sed 's|$$QTMOTIFEXTENSION_LIBDIR|\/usr\/lib|g' -i "$pkgdir"/usr/share/qt4/mkspecs/qtmotifextension.pri 
  sed 's|$$QTMOTIFEXTENSION_LIBNAME|QtSolutions_MotifExtension-2.7|g' -i "$pkgdir"/usr/share/qt4/mkspecs/qtmotifextension.pri
  sed 's|$$PWD|\/usr\/include\/qt4\/QtMotifextension|g' -i "$pkgdir"/usr/share/qt4/mkspecs/qtmotifextension.pri
  mkdir -p "$pkgdir"/usr/share/licenses/qtmotifextension
  cp LICENSE.LGPL "$pkgdir"/usr/share/licenses/qtmotifextension/
  cp LICENSE.GPL3 "$pkgdir"/usr/share/licenses/qtmotifextension/
  cp LGPL_EXCEPTION.txt "$pkgdir"/usr/share/licenses/qtmotifextension/
  }



