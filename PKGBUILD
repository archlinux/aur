# Maintainer: Jaap Crezee <jaap@jcz.nl>
# Contributor: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-serialbus-595
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Reusable Qt serialbus controls to create classic desktop-style user interfaces (v5.9.5)'
depends=('qt5-declarative-595' 'qt5-serialport-595')
makedepends=()
_pkgfqn="qtserialbus-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        "socketcan_missing_include.patch")
sha256sums=('c53e9360e39dfbf27dfc19dba7337174d29691f5dd398f0ef05e803db5eee53f'
            '4b976004ca39b7cff6abbf937be2580674edcb08a21a247468b358f0c31bfba9')

prepare() {
  mkdir -p build
  cd ${_pkgfqn} && patch -p1 -i ../socketcan_missing_include.patch
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
