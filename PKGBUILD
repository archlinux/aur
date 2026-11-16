# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=noblenote-git
epoch=1
pkgver=1.5.0.r0.a25b01d
pkgrel=1
pkgdesc="nobleNote aims to be a lightweight, open source alternative to Evernote and OneNote."
url="https://github.com/hakaishi/nobleNote"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt6-base' 'qt6-svg')
makedepends=('git' 'qt6-tools')

source=('git+https://github.com/hakaishi/nobleNote.git')
sha256sums=('SKIP')

pkgver() {    
  cd "$srcdir/nobleNote"
  git describe --tags --long | sed "s/^v//; s/\-/.r/;s/\-g/./"
}

prepare() {
  cd "$srcdir/nobleNote"
  
  # Add the missing QScreen header so that QWidget::screen() can be used
  sed -i '/#include "note.h"/a #include <QScreen>' src/note.cpp
}

build() {
   cd $srcdir/nobleNote

   msg2 "Executing \"qmake6\"..."
   qmake6

   msg2 "Executing \"make\"..."
   make
}

package() {
   cd $srcdir/nobleNote
   make INSTALL_ROOT=$pkgdir install
   
   # Desktop icon
   install -Dm644 noblenote.desktop $pkgdir/usr/share/applications/noblenote.desktop
   sed -i 's|Icon=noblenote|Icon=/usr/share/pixmaps/noblenote-icons/noblenote|' $pkgdir/usr/share/applications/noblenote.desktop

   # LICENSE
   install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

