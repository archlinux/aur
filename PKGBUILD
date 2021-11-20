# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-quick3d
_qtver=5.15.2
pkgver=5.15.2+kde+r19
pkgrel=2
_commit=3e3e53c834b25dc2959dd30f319d12d6f84ee1e3
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='Qt module and API for defining 3D content in Qt Quick'
depends=('qt5-declarative')
makedepends=('git')
groups=('qt' 'qt5')
_pkgfqn=qtquick3d
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        git+https://code.qt.io/qt/qtquick3d-assimp.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgfqn
  echo "5.15.2+kde+r"`git rev-list --count origin/5.15.2..$_commit`
}

prepare() {
  mkdir -p build

  cd $_pkgfqn
  git revert -n 80196af36528e66826549a8b54d6cc5988db1622 # Revert version bump

  git submodule init
  git submodule set-url src/3rdparty/assimp/src "$srcdir"/qtquick3d-assimp
  git submodule update
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
