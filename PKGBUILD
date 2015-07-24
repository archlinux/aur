# Maintainer: M0Rf30

pkgname=ccdebug
pkgver=1.3.3
pkgrel=2
pkgdesc="A Qt-based graphical gdb debugger frontend"
arch=('i686' 'x86_64')
url="http://ccdebug.sourceforge.net/"
license=('LGPL')
depends=('qt4' 'gdb')
source=("http://prdownloads.sourceforge.net/project/ccdebug/${pkgname}_${pkgver}_src.tgz")

prepare(){
  cd $srcdir/${pkgname}_${pkgver}
# Add missing header for 'access'
  sed -i '27i#include <unistd.h>' strutil.h

# Add missing header for 'getpid'
  sed -i '27i#include <unistd.h>' migdbplugin/MiGdbUtil.h

# Fix 'setDatum' to 'this->setDatum'
  sed -i 's|setDatum|this->setDatum|' CUndo.h
  sed -i 's|void this->setDatum|void setDatum|' CUndo.h
} 

package() {
  cd $srcdir/${pkgname}_${pkgver}
  ./configure --prefix=/usr
  qmake-qt4 LINK_PREFIX=/usr PREFIX=/usr INSTALL_DIR=$pkgdir/usr/bin
  make
  make INSTALL_ROOT="${pkgdir}" install  
  mv $pkgdir/usr/local/bin $pkgdir/usr/ && rm -r $pkgdir/usr/local
  cd migdbplugin/
  make INSTALL_DIR=$pkgdir/usr/bin
  make INSTALL_DIR=$pkgdir/usr/bin install  
}

