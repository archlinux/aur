# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.17
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qwt5' 'qwtplot3d')
source=("http://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}-${pkgver}.tar.gz"
        "https://sourceforge.net/p/scidavis/scidavis-bugs/_discuss/thread/fa133ad9/b8d8/attachment/scidavis-qwt5.patch"
        "scidavis-python2.patch")
md5sums=('4d5356c64bf103e4c1dd06f8a35b8a50'
         '4166c8637deb81bce31d5ee511586245'
         '70665013c8f456c0ebbff8373d4c8d30')
install="${pkgname}.install"

prepare() {
  # fix qwt
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "../scidavis-qwt5.patch"

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

  # install desktop file and icon
  install -Dm644 "scidavis/scidavis.desktop" "${pkgdir}/usr/share/applications/scidavis.desktop"
  install -Dm644 "scidavis/icons/scidavis.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/scidavis.svg"
}

