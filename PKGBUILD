# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-virtualkeyboard
_qtver=5.11.2
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3')
pkgdesc='Virtual keyboard framework'
depends=('qt5-declarative' 'qt5-svg' 'hunspell')
makedepends=()
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-everywhere-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        qt-virtualkeyboard-keylogging.patch::"http://code.qt.io/cgit/qt/qtvirtualkeyboard.git/patch/?id=c7a94110")
sha256sums=('2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197'
            'd6604ea9a73dd16cdc0788214ccd346571a2f5c2f7da7759d71511d3cb6e67e8')

prepare() {
  mkdir -p build

  cd ${_pkgfqn}
  patch -p1 -i ../qt-virtualkeyboard-keylogging.patch # don't log all keypresses
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
