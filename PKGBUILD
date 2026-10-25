# Maintainer: smiley <smiley@archlinux.org>

pkgname=cutecosmic
pkgver=0.2.0
pkgrel=1
pkgdesc="Qt platform theme for the COSMIC desktop environment"
arch=('x86_64')
url="https://github.com/IgKh/cutecosmic"
license=('GPL-3.0-only')
# Uses private Qt APIs: rebuild after every qt6-base update, including patch releases
depends=(
  'gcc-libs'
  'glibc'
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'cargo'
  'cmake'
  'corrosion'
  'git'
)
optdepends=(
  'breeze: Breeze widget style (used by default when installed)'
)
conflicts=('cutecosmic-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2bbc0f4dbb0e16ccbbf77dc53fea99ff56abf32621d831198bb3744fef01c7aa')

prepare() {
  cd "$pkgname-$pkgver/bindings"
  export RUSTUP_TOOLCHAIN=stable
  # No --target: cbindgen runs cargo metadata, which needs crates for every platform
  cargo fetch --locked
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_OFFLINE=true
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
