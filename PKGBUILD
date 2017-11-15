# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-datavis3d
_qtver=5.9.2
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3')
pkgdesc='Qt Data Visualization module'
depends=('qt5-base')
makedepends=('qt5-declarative')
optdepends=('qt5-declarative: QML bindings')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('06ae5699872d048e8bb99464c420db3749c8b7601e9f855ce8b1e156d792b2b2')

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
}
