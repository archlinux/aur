# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-quick3d
_basever=5.15.16
pkgver=5.15.16+kde+r1
pkgrel=3
_commit=4db879b73a7b7546acab87bec50f9265dd1da8bd
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='Qt module and API for defining 3D content in Qt Quick'
depends=('qt5-declarative')
makedepends=('git' 'assimp')
optdepends=('assimp: assimp import plugin')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        qt5-quick3d-assimp-5.1.patch)
sha256sums=('132ffbb978f1e01a3a4c95741be8ea69e1d7c669142f7bd30fb4ae46ee493bb4'
            '57a3ac54c46f86d1f99ce20653bb34215cbd65fbd36f7ee802360336e88f268e')

pkgver() {
  cd kde-$_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
}

prepare() {
  mkdir -p build
  patch -d kde-$_pkgfqn -p1 < qt5-quick3d-assimp-5.1.patch # Fix build with assimp 5.1
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
