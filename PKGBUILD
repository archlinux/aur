# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-pmp-webchannel
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to QObject or QML objects from HTML clients for seamless integration of Qt applications with HTML/JavaScript clients (for plex-media-player)'
depends=('qt5-pmp-declarative')
makedepends=()
groups=('qt5-pmp')
_pkgfqn="${pkgname/5-pmp-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('bfdd75a3a3c522aa31f5b9a4f5cfa631d5a96355ee934a710e612dfbf9d2d977')

prepare() {
  mkdir -p build
}

build() {
  cd build

  /opt/qt5-pmp/usr/bin/qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/opt/qt5-pmp/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/opt/qt5-pmp/usr/share/licenses
  ln -s /opt/qt5-pmp/usr/share/licenses/qt5-base "$pkgdir"/opt/qt5-pmp/usr/share/licenses/${pkgname}
}
