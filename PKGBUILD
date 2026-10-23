# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>

pkgname=zmij
pkgver=1.2
pkgrel=1
pkgdesc='Fast double-to-string conversion library'
arch=(x86_64)
url='https://github.com/vitaut/zmij'
license=(MIT)
makedepends=(cmake git ninja)
options=(staticlibs)
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

# Upstream sets no SOVERSION, so ship a static (PIC) library rather than an unversioned .so.
build() {
  cmake \
    -B build \
    -S zmij \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DZMIJ_EXAMPLE=OFF \
    -GNinja \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 zmij/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
