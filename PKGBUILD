# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webchannel
_basever=5.15.17
pkgver=5.15.17+kde+r3
pkgrel=1
_commit=85ba097de9759efe5563156e43de1ad8473d5d54
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to QObject or QML objects from HTML clients for seamless integration of Qt applications with HTML/JavaScript clients'
depends=('qt5-declarative')
makedepends=('git')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('379bc3b92eadb9f50be239e79d200d3c07447d46a9d4d6da1c75dcc18ecf2727')

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
