# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Sandy Carter <bwrsandman+aur@gmail.com>

pkgname=fuzzylite
pkgver=6.0
pkgrel=4
pkgdesc="C++ fuzzy logic control library"
arch=(x86_64 i686 aarch64)
url="https://github.com/fuzzylite/fuzzylite"
license=(GPL3)
depends=(gcc-libs)
makedepends=(cmake)
provides=('libfuzzylite.so=6.0-64')
changelog=CHANGELOG
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "remove-werror.patch"
)
sha256sums=(
  '7e9f56deb9baf063de2232bfd8285f57ddccb651dae842fe3f587d0ac65ecdb0'
  '397f8888000225c4ee2b4a1b639c04dc59979e041dd3b8a6e7f65344f68d5b3b'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch -Np1 -i "$srcdir/remove-werror.patch"
}

build() {
  cd "$_archive"

  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFL_BUILD_STATIC=OFF \
    -DFL_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$pkgname/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
