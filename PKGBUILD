# Maintainer: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-location-595
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=3
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to position, satellite and area monitoring classes (v5.9.5)'
depends=('qt5-declarative-595')
makedepends=()
_pkgfqn="qtlocation-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        "GCC10.patch"
        "QTBUG-83225.patch")
sha256sums=('41f0390e1709140e3590bed434e63ec00406fac2051529c400c756acbb70a80e'
            '5528fea7e49f1bb5d66b231dd2686b7d5351293232b92ca9015b6008b90caa12'
            '2ec9270a95e8d1adf606d797cc92bca04e6802c03167c87d24c178838d77a3ba')

prepare() {
  mkdir -p build

  cd ${_pkgfqn}
  patch -p1 -i ../GCC10.patch
  patch -p1 -i ../QTBUG-83225.patch
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
