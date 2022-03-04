# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-virtualkeyboard
_basever=5.15.3
pkgver=5.15.3+kde+r3
pkgrel=1
_commit=bb40dee811333929dd467a480dce24ab7af84ef9
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='Virtual keyboard framework'
depends=('qt5-declarative' 'qt5-svg' 'hunspell')
makedepends=('git')
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

  qmake ../${_pkgfqn} CONFIG+="lang-all handwriting"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
