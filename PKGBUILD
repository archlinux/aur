# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Niklas <dev@n1klas.net>

pkgname=qt5-mqtt
_qtver=5.15.2
pkgver=${_qtver/-/}
pkgrel=9
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1/5.0"
arch=(x86_64)
url="http://qt-project.org/"
license=(GPL3 custom)
depends=(qt5-base)
makedepends=(git)
source=("git+https://code.qt.io/qt/qtmqtt.git#tag=v$_qtver")
sha512sums=('SKIP')
_pkgfqn=${pkgname/5-/}

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake ../$_pkgfqn
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
    
  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir"/usr/lib -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
  install -Dm644 "$srcdir"/$_pkgfqn/LICENSE.GPL3-EXCEPT \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.GPL3-EXCEPT
}
