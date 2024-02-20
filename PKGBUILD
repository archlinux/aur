# Maintainer: Sergey Salnikov <salsergey at gmail dot com>

_name=qcustomplot
pkgname=qcustomplot-qt6
pkgver=2.1.1
pkgrel=1
pkgdesc="Qt C++ widget for plotting and data visualization (built with Qt6)"
arch=('x86_64')
url="https://www.qcustomplot.com/"
license=('GPL3')
optdepends=('qcustomplot: header file')
makedepends=('graphviz' 'qt6-base')
source=(
  "${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/ecme2/QCustomPlot/-/archive/v${pkgver}/QCustomPlot-v${pkgver}.tar.bz2"
  "${pkgname}-${pkgver}-source.tar.gz::https://www.qcustomplot.com/release/${pkgver}/QCustomPlot-source.tar.gz"
)
sha512sums=('a9c0fe0c2393858b5de66e78606ef96e57b00e405e0417df7d59d5e93a89f706a1d4767316bf015c76514aedd69553229fd347569b9d68e387103486ee29988f'
            '1feb4f45ef90d7709edb26c9964f0ec85ef4aa30f0a7e9fcd803fae586875e8d6744dbcfe08b21f461816ca426c8a6612f8e9c7ef9d3f5a7150c3de8fa5ee57d')

prepare() {
  mv -v "QCustomPlot-v${pkgver}" "${_name}-${pkgver}"
  cd "${_name}-${pkgver}"
  # move required amalgameted sources into place
  mv -v "../${_name}-source/"*.{cpp,h} .
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
