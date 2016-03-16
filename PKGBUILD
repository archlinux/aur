# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=qt5-doc
_qtver=5.6.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('any')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (Documentation)'
depends=('qt5-base')
makedepends=('qt5-tools' 'python2')
conflicts=('qt')
groups=('qt' 'qt5')
_pkgfqn="qt-everywhere-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/single/${_pkgfqn}.tar.xz")
md5sums=('47763c168f58b1196271b231f03c8bae')

prepare() {
  cd ${_pkgfqn}

  # Use python2 for Python 2.x
  find . -name '*.py' -exec sed -i \
    's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|' {} +
  find -name '*.pro' -o -name '*.pri' | xargs sed -i -e 's|python -c|python2 -c|g' -e 's|python \$|python2 \$|g'

  ln -s /usr/lib/qt/bin qttools/
  ln -s /usr/lib/qt/bin/{rcc,uic,moc} qtbase/bin/
}

build() {
  cd ${_pkgfqn}

  PYTHON=/usr/bin/python2 ./configure -confirm-license -opensource \
    -prefix /usr \
    -bindir /usr/lib/qt/bin \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/include/qt \
    -archdatadir /usr/lib/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples
  make docs
}

package() {
  cd ${_pkgfqn}
  make INSTALL_ROOT="$pkgdir" install_docs

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
