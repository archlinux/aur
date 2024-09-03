# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-serialbus
_basever=5.15.15
pkgver=5.15.15
pkgrel=1
_commit=77dae896b13e36969fefdfa25d711e455d58597b
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Qt module for general purpose serial bus access'
depends=('qt5-serialport')
makedepends=('git')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('5d8487ef5d9642fa2f5f16ad6a9d187bb3ada754579b703ffb958cbf84d4783a')

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
