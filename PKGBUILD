# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR package qt6-declarative-git, official qt5-declarative package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=qt6-declarative
_qtver=6.0.0-beta4
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for QML and JavaScript languages'
depends=(qt6-base)
makedepends=(cmake python vulkan-headers at-spi2-core ninja)
groups=(qt6)
_pkgfqn="${pkgname/6-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/development_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('615eb2eacf0319f3c0ba6c0bd7a82cc0a4a19d4b9e22c0fe656715765cd5aadf')

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
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/qt6-declarative
}
