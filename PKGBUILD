# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-declarative-git
pkgver=5.15.0.r1160.geb2ac8dadf
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for QML and JavaScript languages'
depends=(qt6-base-git)
makedepends=(cmake python vulkan-headers at-spi2-core git)
groups=(qt6)
conflicts=(qt6-declarative)
provides=(qt6-declarative)
source=(git+https://code.qt.io/qt/qtdeclarative.git#branch=dev)
sha256sums=('SKIP')

pkgver() {
  cd qtdeclarative
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S qtdeclarative
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
