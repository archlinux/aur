# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-imageformats
_qtver=6.0.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
#pkgdesc='Plugins for additional image formats: TIFF, MNG, TGA, WBMP'
#depends=(qt6-base jasper libmng libwebp)
# FIXME: It doesn't actually build with MNG support at this point.
pkgdesc='Plugins for additional image formats: TIFF, TGA, WBMP'
depends=(qt6-base jasper libwebp)
makedepends=(cmake ninja git)
groups=(qt6)
_pkgfqn="${pkgname/6-/}-everywhere-src-${_qtver}"
source=("$_pkgfqn::git://code.qt.io/qt/qtimageformats.git#tag=v6.0.0")
sha256sums=('SKIP')

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
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/qt6-imageformats
}
