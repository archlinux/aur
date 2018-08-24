# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Eugen Zagorodniy <e dot zagorodniy at gmail dot com>
# Contributor: Olaf Leidinger <leidola@newcon.de>
# Contributer: Henning Garus <henning.garus@gmail.com>
# Contributor: Thomas Burdick <thomas.burdick@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

# probably should be a split package to anticipate
# python{2,3}-qwt{5,6}-qt{4,5} permutations

pkgname=python2-pyqwt
pkgver=5.2.0
pkgrel=3
pkgdesc="Python bindings for Qt Widgets for Technical Applications"
arch=("x86_64")
url="http://pyqwt.sourceforge.net/"
depends=('python2-pyqt' 'python2-numpy' 'qwt5' 'sip')
options=('!makeflags')
license=("GPL")
provides=('pyqwt')
conflicts=('pyqwt')
source=("http://downloads.sourceforge.net/sourceforge/pyqwt/PyQwt-$pkgver.tar.gz"
        "qplt.py-r1.21.patch"
        "pyqtconfig.py"
)
md5sums=('fcd6c6029090d473dcc9df497516eae7'
         '30011f9139ad12ddbeac79c6a45d4b43'
         '954bc3020a8b5b164b0f49f2ef1e4a6c')
build() {
  cd "$srcdir/PyQwt-$pkgver"

  patch -p1 < ../qplt.py-r1.21.patch

  cd configure
  # pyqtconfig.py came from a modified python2-pyqt4
  # version numbers will need tweaking with pyqt updates
  cp "$srcdir/pyqtconfig.py" ./
  sed -i "s|-march=native|-march=${CARCH/_/-}|g" -i pyqtconfig.py

  sed -i "s/'qmake'/'qmake-qt4'/" configure.py
  sed -i "s/'qwt'/'qwt5'/" configure.py
  sed -i "s/PyQt4.pyqtconfig/pyqtconfig/" configure.py
  python2 configure.py -I/usr/include/qwt5 -lqwt5 -I/usr/include/qt4 \
    --disable-numarray --disable-numeric
  sed -i "s|/usr/include/Qt|/usr/include/qt4/Qt|g" iqt5qt4/Makefile
  sed -i "s|/usr/include/Qt|/usr/include/qt4/Qt|g" qwt5qt4/Makefile
  make
  sed -i -e "s|env python$|env python2|" $(find "$srcdir" -name '*.py')
}

package() {
  cd "$srcdir/PyQwt-$pkgver/configure"

  make DESTDIR="$pkgdir" install
}

