# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-charts
_basever=5.15.3
pkgver=5.15.3+kde+r0
pkgrel=1
_commit=f13988aa1ad9de5d92e7b0ba4d0d947dd019d759
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='Provides a set of easy to use chart components'
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
