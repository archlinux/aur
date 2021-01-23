# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-quick3d
_qtver=5.15.2
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Qt module and API for defining 3D content in Qt Quick'
depends=('qt5-declarative')
makedepends=('assimp')
optdepends=('assimp: Import from assimp')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
         qtquick3d-assimp.patch
         qtbug-90564.patch)
sha256sums=('5b0546323365ce34e4716f22f305ebb4902e222c1a0910b65ee448443c2f94bb'
            '531c479880b51a0e5247ccba1b5158b99d16d2a8d4d63b462572687bef1862ef'
            '7301fbdd7d4d5fbcbb1f5e2567ae231d2fc1682a0f0620589930946c49535c10')

prepare() {
  mkdir -p build

  cd $_pkgfqn
  patch -p1 -i ../qtquick3d-assimp.patch # Fix build with system assimp
  patch -p1 -i ../qtbug-90564.patch # Fix crash in QML designer if assimp is not installed
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
