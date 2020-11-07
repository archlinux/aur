# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-svg
_qtver=6.0.0-beta3
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for displaying the contents of SVG files'
depends=(qt6-base)
makedepends=(cmake ninja)
groups=(qt6)
_pkgfqn="${pkgname/6-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/development_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('4006d5cdbeb805bb97f4f7c38604e075022a8baca0f640287e2139ead96bc011')

build() {
  cmake -G Ninja -B build -S $_pkgfqn
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/qt6-svg
}
