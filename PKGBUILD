# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=godot-cpp
pkgver=4.2
pkgrel=1
pkgdesc='C++ bindings for the Godot script API'
arch=('x86_64')
url='https://godotengine.org'
license=('MIT')
makedepends=(cmake godot=$pkgver)
source=(
  https://github.com/godotengine/$pkgname/archive/refs/tags/godot-$pkgver-stable.tar.gz
  godot-cpp.pc.in
)
sha256sums=('a11d619cc148318e7500c18f239e5b89de7051b36e23359692f8e0cfe3fc3494'
            '675cbdf08979edcf5cbd951b88a6b00b5d5a24fd9c68418b8d7b4c77dcf722a3')

prepare() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  sed "s/@VERSION@/$pkgver/" "$srcdir"/godot-cpp.pc.in > godot-cpp.pc
}

build() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  cd gdextension
  godot --display-driver headless --dump-extension-api --dump-gdextension-interface
  cd ..

  cmake -Bbuild \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-type-limits" \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  install -dm755 "$pkgdir"/usr/{lib,include}
  install -Dm644 build/bin/libgodot-cpp.linux.*.a "$pkgdir"/usr/lib/libgodot-cpp.a
  install -Dm644 godot-cpp.pc "$pkgdir"/usr/lib/pkgconfig/godot-cpp.pc
  cp -rup {,build/gen/}include/godot_cpp "$pkgdir"/usr/include
  install -Dm644 gdextension/gdextension_interface.h "$pkgdir"/usr/include/godot_cpp

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
