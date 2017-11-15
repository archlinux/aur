# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-virtualkeyboard
_qtver=5.9.2
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3')
pkgdesc='Virtual keyboard framework'
depends=('qt5-declarative' 'qt5-svg' 'hunspell')
makedepends=()
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('e836ca0348b21df28635e541713726444abed7b53a0acf3358cc90532e64c6fc')

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
