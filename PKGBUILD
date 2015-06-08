# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Knut Franke <Knut.Franke ad gmx dot de>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Robal <nigrantis.tigris at gmail dot com>
# Contributor: Alexander <chronischzuspaet at gmail dot com> Kempen

pkgname=scidavis
pkgver=1.D8
pkgrel=3
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of QtiPlot"
arch=('i686' 'x86_64')
url="http://scidavis.sourceforge.net/"
license=('GPL')
makedepends=('boost' 'cmake')
depends=('gsl' 'glu' 'mesa' 'muparser' 'python2-pyqt4' 'shared-mime-info'
         'qt-assistant-compat' 'qwt5' 'qwtplot3d')
source=(http://prdownloads.sourceforge.net/sourceforge/scidavis/${pkgname}.${pkgver}.tar.gz
        scidavis-python.patch
        scidavis-qtassistant.patch
        scidavis-qwt5.patch)
install=${pkgname}.install
md5sums=('c421b6a38f5183780bdf6c5960d92df5'
         '0fefd6afe2fbc69b5faadd1112e79d7f'
         'b35c4fcbc22ca981a1679ae571ab3bed'
         '749297643799f48527178bdb43ad94e7')

prepare() {
  cd "${srcdir}"
  # python patch
  patch -p0 -i "${srcdir}/scidavis-python.patch"
  # fix qtassistant
  patch -p0 -i "${srcdir}/scidavis-qtassistant.patch"
  # fix qwt
  patch -p0 -i "${srcdir}/scidavis-qwt5.patch"
}

build() {
  cd "${srcdir}/${pkgname}.${pkgver}"
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}.${pkgver}"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install

  _pydir=$(python2 -c "from distutils import sysconfig; print sysconfig.get_python_lib()")
  python2 $(dirname ${_pydir})/py_compile.py "${pkgdir}/etc/scidavisrc.py"
  python2 $(dirname ${_pydir})/py_compile.py "${pkgdir}/usr/share/scidavis/scidavisUtil.py"

  # remove liborigin files since it uses static library
  rm -rf "${pkgdir}/usr/local"
}
