# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-quick3d
_qtver=5.15.2
pkgver=5.15.2+kde+r18
pkgrel=1
_commit=e3dfdf1bed735dc720f08c4a01cdc7ddbe7623f7
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Qt module and API for defining 3D content in Qt Quick'
depends=('qt5-declarative')
makedepends=('assimp' 'git')
optdepends=('assimp: Import from assimp')
groups=('qt' 'qt5')
_pkgfqn=qtquick3d
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        qtquick3d-assimp.patch)
sha256sums=('SKIP'
            '531c479880b51a0e5247ccba1b5158b99d16d2a8d4d63b462572687bef1862ef')

pkgver() {
  cd $_pkgfqn
  echo "5.15.2+kde+r"`git rev-list --count origin/5.15.2..$_commit`
}

prepare() {
  mkdir -p build

  cd $_pkgfqn
  git revert -n 80196af36528e66826549a8b54d6cc5988db1622 # Revert version bump
  patch -p1 -i ../qtquick3d-assimp.patch # Fix build with system assimp
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
