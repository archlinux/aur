# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-websockets
_basever=5.15.8
pkgver=5.15.8+kde+r2
pkgrel=1
_commit=63fb8da1ecf8e48262cd515690cf71a425f92bf5
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides WebSocket communication compliant with RFC 6455'
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
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
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

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
