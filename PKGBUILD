# Maintainer: Ainola
# Contributor: speps

_pkg=PythonQt
pkgname=pythonqt
pkgver=2.1
pkgrel=1
pkgdesc="A dynamic Python binding for the Qt framework to embed Python code into C++ Qt applications."
arch=(i686 x86_64)
url="http://pythonqt.sourceforge.net/"
license=('LGPL')
depends=('qtwebkit' 'python2')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$_pkg-$pkgver/$_pkg${pkgver}_Qt4.8.zip")
md5sums=('2113eac423696e3a00426cb50c375f81')

build() {
  cd "$srcdir/$_pkg${pkgver}_Qt4.8"

  # set python version to 2.7
  sed -i "s|2.6|2.7|" build/python.prf

  [ -d bld ] || mkdir bld && cd bld
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPythonQt_DEBUG:BOOL=ON \
        -DPythonQt_Wrap_Qtcore:BOOL=ON \
        -DPythonQt_Wrap_Qtgui:BOOL=ON \
        -DPythonQt_Wrap_Qtnetwork:BOOL=ON \
        -DPythonQt_Wrap_Qtopengl:BOOL=ON \
        -DPythonQt_Wrap_Qtsql:BOOL=ON \
        -DPythonQt_Wrap_Qtsvg:BOOL=ON \
        -DPythonQt_Wrap_Qtuitools:BOOL=ON \
        -DPythonQt_Wrap_Qtwebkit:BOOL=ON \
        -DPythonQt_Wrap_Qtxml:BOOL=ON \
        -DPythonQt_Wrap_Qtxmlpatterns:BOOL=OFF .. # Broken
  make

  # docs
  cd ../doxygen && doxygen doc.cfg
}

package() {
  cd "$srcdir/$_pkg${pkgver}_Qt4.8/bld"
  make DESTDIR="$pkgdir/" install

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 ../doxygen/html/* "$pkgdir/usr/share/doc/$pkgname/html"
}

# vim:set ts=2 sw=2 et:
