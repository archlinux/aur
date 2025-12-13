# Maintainer: Sergey Salnikov <salsergey at gmail dot com>

_name=qcustomplot
pkgname=qcustomplot-qt6
pkgver=2.1.1
pkgrel=2
pkgdesc="Qt C++ widget for plotting and data visualization (built with Qt6)"
arch=('x86_64')
url="https://www.qcustomplot.com/"
license=('GPL3')
optdepends=('qcustomplot: header file')
makedepends=('graphviz' 'qt6-base')
source=(
  "${pkgname}-${pkgver}-sharedlib.tar.gz::https://www.qcustomplot.com/release/${pkgver}/QCustomPlot-sharedlib.tar.gz"
  "${pkgname}-${pkgver}-source.tar.gz::https://www.qcustomplot.com/release/${pkgver}/QCustomPlot-source.tar.gz"
)
sha512sums=('c661e4a835066fee92b254fbd7b825dbd5c58973189ff2099a01308cb81fe6bf3bac1456f5da91f01c6265f8f548f61b57e237d00a9b5c2c94acf1a024baa18e'
            '1feb4f45ef90d7709edb26c9964f0ec85ef4aa30f0a7e9fcd803fae586875e8d6744dbcfe08b21f461816ca426c8a6612f8e9c7ef9d3f5a7150c3de8fa5ee57d')

prepare() {
  mv -v "${_name}-source" "${_name}-${pkgver}"
  cd "${_name}-${pkgver}"
  mv -v "../${_name}-sharedlib" sharedlib

  # rename libraries to qcustomplot-qt6
  sed -i 's/TARGET = qcustomplot/TARGET = qcustomplot-qt6/' sharedlib/sharedlib-compilation/sharedlib-compilation.pro
}

build() {
  cd "${_name}-${pkgver}"
  qmake6 sharedlib/sharedlib-compilation/sharedlib-compilation.pro
  make
}

package_qcustomplot-qt6() {
  depends=('qt6-base')
  provides=('libqcustomplot-qt6.so')

  cd "${_name}-${pkgver}"
  # there is no install target
  install -vdm 755 "${pkgdir}/usr/lib/"
  cp -av "lib${pkgname}.so"* "${pkgdir}/usr/lib/"
  install -vDm 644 changelog.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
