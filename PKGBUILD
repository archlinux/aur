# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-virtualkeyboard
_basever=5.15.16
pkgver=5.15.16
pkgrel=3
_commit=365f79ee89c6a57f205fe6c89817c51ff52ea059
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='Virtual keyboard framework'
depends=('qt5-declarative' 'qt5-svg' 'hunspell')
makedepends=('git')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('3f385f27819dde3130511c1e7dff650ade187f2c559d8519045cdf142cf2f058')

pkgver() {
  cd kde-$_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../kde-$_pkgfqn CONFIG+="lang-all handwriting"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
