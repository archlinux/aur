# Maintainer: Jaap Crezee <jaap@jcz.nl>
# Contributor: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-graphicaleffects-595
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Reusable Qt Graphical Effects based UI controls to create classic desktop-style user interfaces (v5.9.5)'
depends=('qt5-base-595')
makedepends=()
_pkgfqn="qtgraphicaleffects-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('0b8d400858dd7a38b84a9ec3600c7d9c60193394188fbbed95cb05897b072635')

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
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/opt/qt595/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/opt/qt595/share/licenses
  ln -s /opt/qt595/share/licenses/qt5-base "$pkgdir"/opt/qt595/share/licenses/${pkgname}
}
