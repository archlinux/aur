# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-serialbus
_basever=5.15.17
pkgver=5.15.17
pkgrel=1
_commit=971adee604b772d79686126fe8b1e333824f67dc
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Qt module for general purpose serial bus access'
depends=('qt5-serialport')
makedepends=('git')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('fa28b2d5b0756f410b99a8cb82ab27da189449a065e80dab076ffc417824256d')

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
