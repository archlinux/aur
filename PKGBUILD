# Maintainer: Yann Leretaille <yann@leretaille.com>
pkgname=ucode-lang
pkgver=20260227.934bb59
pkgrel=1
pkgdesc="Tiny ECMAScript-like scripting language used in OpenWrt"
arch=(x86_64 aarch64)
url="https://github.com/jow-/ucode"
license=(ISC)
depends=(json-c libmd zlib)
makedepends=(cmake git pkgconf)
source=("git+https://github.com/jow-/ucode.git#commit=934bb593dba520e84920865703bd4fe94490d11e")
b2sums=('SKIP')

prepare() {
  cd "$srcdir/ucode"
}

build() {
  # GCC 15 triggers upstream const-type warnings promoted to errors; keep build working.
  cmake -S "$srcdir/ucode" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=discarded-qualifiers -Wno-error=incompatible-pointer-types" \
    -DUBUS_SUPPORT=OFF \
    -DUCI_SUPPORT=OFF \
    -DULOOP_SUPPORT=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
