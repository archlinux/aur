# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-sensors
_qtver=5.14.0
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to sensor hardware and motion gesture recognition'
depends=('qt5-base')
makedepends=('qt5-declarative')
optdepends=('qt5-declarative: QML bindings')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('306fc19309b218b062eb6415e2a8364c5c3b53c2942e200012d45f0c33717926')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
