# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-svg
_qtver=6.0.0-rc
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
sha256sums=('cbd8de2db7d2af14ae7d5dffb6c63507c10261d5b02fce25eabdcb48cf9c8258')

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
