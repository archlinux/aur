# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-remoteobjects
_basever=5.15.16
pkgver=5.15.16
pkgrel=3
_commit=aa61cc683979ea1413222e64a03aae9971392e3d
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Inter-process communication (IPC) module developed for Qt'
depends=(qt5-base)
makedepends=(qt5-declarative git)
optdepends=('qt5-declarative: QML bindings')
groups=(qt5)
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('6f66fa251a76ad7e122a357a8f4cc9e8bbab1a3cc64d52d96f22cd21c426af36')

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
