# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webchannel
_basever=5.15.9
pkgver=5.15.9+kde+r3
pkgrel=1
_commit=c508ffb1996eeddfd10dda493974746e6b375080
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to QObject or QML objects from HTML clients for seamless integration of Qt applications with HTML/JavaScript clients'
depends=('qt5-declarative')
makedepends=('git')
groups=('qt' 'qt5')
_pkgfqn=${pkgname/5-/}
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('SKIP')

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
