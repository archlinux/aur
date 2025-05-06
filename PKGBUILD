# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=pololu-tic-software
pkgver=1.8.3
pkgrel=1
pkgdesc="Pololu Tic software and library"
url="https://www.pololu.com/category/212/tic-stepper-motor-controllers"
license=(MIT)
arch=(i686 x86_64)

depends=(
  gcc-libs
  glibc
  libusbp-1
  qt5-base
)
makedepends=(
  cmake
  git
)

source=(
  "git+https://github.com/pololu/pololu-tic-software.git#tag=$pkgver"
)
sha256sums=(
  '5098ef1775522462ebaf3f1f915ec8ce89a3debf2dbda0effc93b4b61b316e5c'
)

build() {
  # It would be nice to enable USE_SYSTEM_LIBYAML and USE_SYSTEM_LIBTINYXML,
  # but the vendored versions are old enough to have different APIs.
  cmake \
    -B build \
    -S $pkgname \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" "$pkgname/udev-rules/99-pololu.rules"
}
