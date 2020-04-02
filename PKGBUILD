# Maintainer: Anonymous

pkgname=loiq
pkgver=0.3.1a
pkgrel=6
pkgdesc="Low Orbit Ion Cannon - Qt Edition"
url='http://sourceforge.net/projects/loiq'
arch=('x86_64')
source=("http://downloads.sourceforge.net/project/salix-sbo/13.37/loiq/loiq-${pkgver}.tar.bz2"
            'loiq.desktop'
            'loiq.png'
            )
license=('GPL')
depends=('qt5-base')
sha256sums=('7745b84b8eaa01348789ed714fc7789888ee3cfb52139a1cafdc6b53de718e64'
            '57e5fdaa5766bec8319b500e9a6de68d7e52f63ee054df1a8ab4185bd0636b61'
            '8de3493baf723d585f1557c30e012b2c9487c4ad1c3488563153ffb2f5c6eab3'
            )

prepare() {
  mkdir -p build

  find "loiq-${pkgver}" \( -name '*.o' -o -name '*.qm' \) -delete

  sed -e 's|TARGET =|TARGET = loiq|g' \
      -e 's|network|widgets network|g' \
      -e "15iQMAKE_LFLAGS = ${LDFLAGS}\n" \
      -i "loiq-${pkgver}/loiq.pro"

  sed -e 's|QtGui|QtWidgets|g' \
      -e 's|, QApplication::UnicodeUTF8||g' \
      -i "loiq-${pkgver}/src/ui_main_window.h"

  (cd "loiq-${pkgver}/translations"; for i in *.ts; do lrelease-qt5 ${i} -qm ${i//ts/qm}; done)

  cd build
  qmake-qt5 "../loiq-${pkgver}"
}

build() {
  make -C build
}

package() {
  install -Dm755 build/loiq "${pkgdir}/usr/bin/loiq"

  install -Dm644 "${srcdir}/loiq.desktop" "${pkgdir}/usr/share/applications/loiq.desktop"
  install -Dm644 "${srcdir}/loiq.png" "${pkgdir}/usr/share/pixmaps/loiq.png"
}
