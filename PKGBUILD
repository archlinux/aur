# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgbase=python-qcustomplot-pyqt
pkgname=('python-qcustomplot-pyqt5' 'python-qcustomplot-pyqt6')
pkgver=2.1.1.2
pkgrel=1
pkgdesc="Python bindings to QCustomPlot - Qt C++ widget for plotting and data visualization"
arch=('i686' 'x86_64')
url="https://github.com/salsergey/QCustomPlot-PyQt"
license=('MIT' 'GPL3')
makedepends=('sip' 'pyqt-builder' 'python-pyqt5' 'python-pyqt6' 'qcustomplot>=2.1.0' 'qcustomplot-qt6>=2.1.0')
source=("https://github.com/salsergey/QCustomPlot-PyQt/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha512sums=('805737a8908deead38c178442e5ac6310d247706d64b95f5a5180256506591c1dc2eb7f97162fb42673e6a65f00f6d190031442ffb5d776922aefcbeb77469e9')

build() {
  cd "${pkgbase}-${pkgver}"
  sip-build --verbose --no-static-qcustomplot --build-dir build5
  sip-build --verbose --no-static-qcustomplot --qcustomplot-lib qcustomplot-qt6 --qmake /usr/bin/qmake6 --build-dir build6
}

package_python-qcustomplot-pyqt5() {
  depends=('python-pyqt5' 'qcustomplot>=2.1.0')

  echo "Installing python-qcustomplot-pyqt5 ..."
  cd "${pkgbase}-${pkgver}/build5"
  make INSTALL_ROOT="$pkgdir" install
  cd ..
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  cp -r examples $pkgdir/usr/share/doc/${pkgname}
  install -Dm644 README.md -t $pkgdir/usr/share/doc/${pkgname}
  install -Dm644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE-gpl-3.0.txt -t $pkgdir/usr/share/licenses/${pkgname}
}

package_python-qcustomplot-pyqt6() {
  depends=('python-pyqt6' 'qcustomplot-qt6>=2.1.0')

  echo "Installing python-qcustomplot-pyqt6 ..."
  cd "${pkgbase}-${pkgver}/build6"
  make INSTALL_ROOT="$pkgdir" install
  cd ..
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  cp -r examples $pkgdir/usr/share/doc/${pkgname}
  sed 's/PyQt5/PyQt6/g' -i $pkgdir/usr/share/doc/${pkgname}/examples/*/*
  install -Dm644 README.md -t $pkgdir/usr/share/doc/${pkgname}
  install -Dm644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE-gpl-3.0.txt -t $pkgdir/usr/share/licenses/${pkgname}
}
