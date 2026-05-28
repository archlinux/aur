# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-purchasing
_basever=5.15.19
pkgver=5.15.19
pkgrel=1
_commit=b471c6ca3edfa5ba459b8694622825b9e776bed6
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Qt In-App Purchasing API'
depends=('qt5-base')
makedepends=('qt5-declarative' 'git')
optdepends=('qt5-declarative: QML bindings')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('ddb532462550dbad0f930ceeea20b875b6b2645ff99dbf9053704402395d5188')

pkgver() {
  cd kde-$_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../kde-$_pkgfqn
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
