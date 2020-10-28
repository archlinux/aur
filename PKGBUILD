# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-tools
_qtver=6.0.0-beta2
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (Development Tools, QtHelp)'
depends=(qt6-base hicolor-icon-theme)
makedepends=(cmake qt6-declarative vulkan-headers llvm clang ninja)
optdepends=('clang: for qdoc and lupdate')
groups=(qt6)
_pkgfqn="${pkgname/6-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/development_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('06f41e6c50bcb0e278cc69d2cae9ad06a06a45ca2ed5939ccd93e101d6ebe862')

build() {
  cmake -G Ninja -B build -S $_pkgfqn
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir "$pkgdir"/usr/bin
  for b in "${pkgdir}"/usr/lib/qt6/bin/*; do
    ln -rs "$pkgdir"/usr/lib/qt6/bin/$(basename $b) "$pkgdir"/usr/bin/$(basename $b)-qt6
  done

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/qt6-tools
}
