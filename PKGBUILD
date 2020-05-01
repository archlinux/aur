# Maintainer: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-tools-595
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (Development Tools, QtHelp) (v5.9.5)'
depends=('qt5-base-595' 'hicolor-icon-theme')
makedepends=('qt5-declarative-595')
conflicts=('qtchooser')
_pkgfqn="qttools-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('2c120f9b8f85adeeb98a60f027bf683115ff35e8985abb05fc9160305b15d2b3')

prepare() {
  mkdir -p build
}

build() {
  QT_BASE_DIR=/opt/qt595
  export QTDIR=$QT_BASE_DIR
  export PATH=$QT_BASE_DIR/bin:$PATH
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="${pkgdir}" install

  cd ../${_pkgfqn}

  # Symlinks for backwards compatibility
  for b in "${pkgdir}"/opt/qt595/bin/*; do
    ln -s /opt/qt595/bin/$(basename $b) "${pkgdir}"/opt/qt595/bin/$(basename $b)-qt5
  done

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/opt/qt595/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/opt/qt595/share/licenses
  ln -s /opt/qt595/share/licenses/qt5-base "$pkgdir"/opt/qt595/share/licenses/${pkgname}
}
