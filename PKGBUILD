# Maintainer:

pkgname=python-pyqt5-webkit
pkgdesc="Python bindings for the Qt5WebKit"
pkgver=5.15.7
pkgrel=3
arch=(x86_64)
url="https://riverbankcomputing.com/software/pyqt/intro"
license=(GPL)
groups=(pyqt5)
depends=(python-pyqt5 qt5-webkit)
makedepends=(sip pyqt-builder)
source=("https://pypi.python.org/packages/source/P/PyQt5/PyQt5-$pkgver.tar.gz")
sha256sums=('755121a52b3a08cb07275c10ebb96576d36e320e572591db16cfdbc558101594')
options=(debug)

build() {
  cd PyQt5-$pkgver
  sip-build \
    --confirm-license \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python \
    --pep484-pyi \
    --enable QtCore \
    --enable QtWebKit \
    --enable QtWebKitWidgets
  cd build
  make
}

package(){
  cd PyQt5-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install -j1

  # Remove files provided by pyqt5:
  rm -r "$pkgdir"/usr/{bin,share,lib/python*/site-packages/{*.dist-info,PyQt5/{QtCore.*,bindings/QtCore,uic,sip.pyi,py.typed,__init__.py}}}

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib
}
