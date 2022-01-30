# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-connectivity
_qtver=5.15.2
pkgver=5.15.2+kde+r5
pkgrel=2
_commit=5e9ca5d36d65dadb98ef90013a1dcf15fbd7ae26
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to Bluetooth hardware'
depends=('qt5-base' 'bluez-libs')
makedepends=('qt5-declarative' 'git')
optdepends=('qt5-declarative: QML bindings')
groups=('qt' 'qt5')
_pkgfqn=qtconnectivity
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('SKIP')
options=(debug)

pkgver() {
  cd $_pkgfqn
  echo "5.15.2+kde+r"`git rev-list --count origin/5.15.2..$_commit`
}

prepare() {
  mkdir -p build

  cd $_pkgfqn
  git revert -n 69a87a9b831e36a578594a0a13130c384ad03121 # Revert version bump
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
