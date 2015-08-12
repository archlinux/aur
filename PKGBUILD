# Contributor: Kosyak <ObKo@mail.ru>
pkgbase=qextserialport
pkgname=('qextserialport-qt4' 'qextserialport-qt5')
pkgver=1.2rc
pkgrel=5
pkgdesc="Cross-platform serial port class libary for Qt4 and Qt5."
arch=('i686' 'x86_64')
url='https://github.com/qextserialport/qextserialport'
license=('BSD')
depends=('qt4' 'qt5-base')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/qextserialport/qextserialport/archive/${pkgver}.tar.gz")
sha1sums=('2cd3ec6771b056db1bdf471517f8e20e8a4ecff2')

prepare() {
  mkdir -p build-{qt4,qt5}
}

build() {
  cd "${srcdir}/build-qt4"

  qmake-qt4 "../qextserialport-${pkgver}"
  make
  cd "${srcdir}/build-qt5"

  qmake-qt5 "../qextserialport-${pkgver}"
  make
}

package_qextserialport-qt4() {
  make -C build-qt4 INSTALL_ROOT="$pkgdir" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
}

package_qextserialport-qt5() {
  make -C build-qt5 INSTALL_ROOT="$pkgdir" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
}
