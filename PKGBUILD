# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-datavis3d
_basever=5.15.5
pkgver=5.15.5+kde+r0
pkgrel=1
_commit=a32c95d27224c6c9e41d6080ea54bc937c5d1455
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='Qt Data Visualization module'
depends=('qt5-base')
makedepends=('qt5-declarative' 'git')
optdepends=('qt5-declarative: QML bindings')
groups=('qt' 'qt5')
_pkgfqn=${pkgname/5-/}
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('SKIP')
options=(debug)

pkgver() {
  cd $_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit`
}

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
}
