# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.22
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qwt5' 'qwtplot3d')
source=("https://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}-${pkgver}.tar.gz"
        "scidavis-python2.patch")
sha512sums=('07d94b2f8a05f28d2d461ee6109397a648bfcdcd479fca886771ad04ef8e21bfb1703891077c67a0a4a4dca5b1c31bc7029e33ebd982425a41efce42fa3319b6'
            '3382e664df6e4f6ffc78ad974e3d27afbb6ffb091bd1b397e627cd4d0381e9c20c4c4a18f920ecb2a24e807765dd770d446197c93dc2d365acb0c722c4d0c63a')

prepare() {
  cd "${pkgname}-${pkgver}"

  # replace to python2
  find . -name '*.py' -type f -exec \
      sed -i 's|/usr/bin/python|/usr/bin/python2|' {} \;
  patch -p1 -i "../scidavis-python2.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt4 CONFIG+="liborigin python"
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
