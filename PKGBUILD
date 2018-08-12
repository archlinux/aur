# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: sebfry <sebfry -at- gmail -dot- com>

pkgname=python-pyqtchart
pkgver=5.11.2
pkgrel=2
pkgdesc="Python bindings for the Qt Charts library"
url="https://www.riverbankcomputing.com/software/pyqtchart/"
depends=('python-pyqt5' 'qt5-charts')
license=('GPL3')
arch=('i686' 'x86_64')
source=(
    "https://sourceforge.net/projects/pyqt/files/PyQtChart/PyQtChart-$pkgver/PyQtChart_gpl-$pkgver.tar.gz"
    'mkdistinfo-installroot.diff')
sha256sums=('f8d5d44934ef93b5c5f21d56bd05b3d55563a7c79dd5943ea854d1e7cff81e19'
            '3a5d61142c0bca7f40cebcf9e3516e30886e10504999f4fbe2359ac67b35b9bc')


prepare() {
  cd "$srcdir/PyQtChart_gpl-$pkgver"

  patch -Np0 -i "${srcdir}/mkdistinfo-installroot.diff"
}

build() {
  cd "$srcdir/PyQtChart_gpl-$pkgver"

  local _pyver=$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')
  local _moddir="/usr/lib/python${_pyver}/site-packages/PyQt5"

  python configure.py \
    --destdir="${_moddir}" \
    --stubsdir="${_moddir}" \
    --qtchart-sipdir=/usr/share/sip/PyQt5 \
    --apidir=/usr/share/qt/qsci
  make
}

package() {
  cd "$srcdir/PyQtChart_gpl-$pkgver"

  # INSTALL_ROOT needs to be in shell environment for mk_distinfo.py script
  export INSTALL_ROOT="${pkgdir}"
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
