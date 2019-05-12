# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.25
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python-pyqt4' 'shared-mime-info'
         'qwt5' 'qwtplot3d')
source=("https://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}-${pkgver}.tar.gz")
sha512sums=('23616614361935d0aa9fdd51a582a8ab0d035f6ab6dfc23548964b2f3aca1122a013577b7743574fd8f32acdf88e2e719c2fc358f8df9394741065055491566b')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt4 CONFIG+="liborigin python" QMAKE_CXXFLAGS=-fpermissive
  make qmake
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"

  # install translations (it looks like it does not provide target to do it)
  install -dm755 "${pkgdir}/usr/share/scidavis/translations/"
  find "scidavis/translations/" -name '*.qm' -type f -exec \
      install -Dm644 {} "${pkgdir}/usr/share/scidavis/translations/" \;
}
