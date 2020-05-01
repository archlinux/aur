# Maintainer: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-declarative-595
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Classes for QML and JavaScript languages (v5.9.5)'
depends=('qt5-base-595' 'qt5-xmlpatterns-595')
makedepends=('python2' 'cmake')
_pkgfqn="qtdeclarative-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('b41868087b8315f7b56dd01441b9efdbad6f2db6a74227be86200dd44286798b')

prepare() {
  mkdir -p build

  # Use python2 for Python 2.x
  find -name '*.pro' -o -name '*.pri' | xargs sed -i -e 's|python -c|python2 -c|g' -e 's|python \$|python2 \$|g'
}

build() {
  export QT_BASE_DIR=/opt/qt595
  export QTDIR=$QT_BASE_DIR
  export PATH=$QT_BASE_DIR/bin:$PATH

  cd build

  export PYTHON=python2
  qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Symlinks for backwards compatibility
  for b in "$pkgdir"/opt/qt595/bin/*; do
    ln -s /opt/qt595/bin/$(basename $b) "$pkgdir"/opt/qt595/bin/$(basename $b)-qt5
  done

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/opt/qt595/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/opt/qt595/share/licenses
  ln -s /opt/qt595/share/licenses/qt5-base "$pkgdir"/opt/qt595/share/licenses/${pkgname}
}
