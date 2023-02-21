# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=godot-cpp
pkgver=3.5.1
pkgrel=1
pkgdesc='C++ bindings for the Godot script API'
arch=('x86_64')
url='https://godotengine.org'
license=('MIT')
depends=(godot-headers)
makedepends=(scons clang llvm)
source=(
  https://github.com/godotengine/$pkgname/archive/refs/tags/godot-$pkgver-stable.tar.gz
  godot-cpp.pc.in
)
sha256sums=('a0ab1f117d30ab01837e39e7ff704bbded282db4643343579b2bca11794f99fc'
            'fc0b47b2b2edbeef088d0c1a124e597df7474d820eba833ce7822ed670f92974')

prepare() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  sed "s/@VERSION@/$pkgver/" "$srcdir"/godot-cpp.pc.in > godot-cpp.pc

  rm -rf godot-headers
  cp -r /usr/include/godot godot-headers
}

build() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  scons -j16 platform=linux use_llvm=yes generate_bindings=yes target=release
}

package() {
  cd "$srcdir"/${pkgname}-godot-${pkgver}-stable

  install -dm00755 "$pkgdir"/usr/{lib,include}
  install -Dm00644 bin/libgodot-cpp.linux.*.a "$pkgdir"/usr/lib/libgodot-cpp.a
  install -Dm00644 godot-cpp.pc "$pkgdir"/usr/lib/pkgconfig/godot-cpp.pc
  cp -rup include "$pkgdir"/usr/include/godot
  install -Dm00644 LICENSE.md "$pkgdir"/usr/share/licenses/godot-cpp/LICENSE.md
}
