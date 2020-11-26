# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-tools
_qtver=6.0.0-rc
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
sha256sums=('6fe789cf7e1abc7f0ac39027c53e7880433425b234d448d1500e583e9c3ba498')

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
