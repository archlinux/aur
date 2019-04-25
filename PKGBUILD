# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=kcheckers
pkgver=0.8.1
pkgrel=11
pkgdesc="Qt-based checkers boardgame"
arch=('x86_64')
url="http://qcheckers.sourceforge.net/"
license=('GPL')
depends=('qt5-base')
source=(https://downloads.sourceforge.net/qcheckers/${pkgname}-${pkgver}.tar.gz
        qt5-migration.diff
        kcheckers.desktop)
md5sums=('793736a007cd92122dfd91bcfd14ab69'
         '310f61c6e4366f2fe9ad40e16f779cf0'
         '25b2605f4d605615e265150b722f1897')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # patch from Debian
  patch -p1 < ../qt5-migration.diff
  sed -i 's|/usr/local|/usr|' common.h
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake kcheckers.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/usr" install
  rm "${pkgdir}"/usr/share/kcheckers/*.ts
  install -Dm644 "${srcdir}/kcheckers.desktop" "${pkgdir}/usr/share/applications/kcheckers.desktop"
}
