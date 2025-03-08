# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Niklas <dev@n1klas.net>

pkgname=qt5-mqtt
_qtver=5.15.2
pkgver=${_qtver/-/}
pkgrel=18
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1/5.0"
arch=(x86_64)
url="http://qt-project.org/"
license=(GPL3 custom)
depends=(qt5-base)
makedepends=(git)
source=("git+https://code.qt.io/qt/qtmqtt.git#tag=v$_qtver")
sha512sums=('6b8498dc9d3e0ca41a7db9fa0e39bc6f53d555d9f193cb580f94edcfb5810ab473cc951a720ca32a5f7bb944d671aa5c4f0f32c4291454510610b877c1335e6a')
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
