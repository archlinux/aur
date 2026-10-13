# Maintainer: RainOrigami <rain+github@codefreak.net>

pkgname=tanglewire
pkgver=0.1.0
pkgrel=1
pkgdesc="PipeWire patchbay that lays the graph out by itself"
arch=('x86_64')
url="https://github.com/RainOrigami/TangleWire"
license=('Unlicense')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'graphene'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libpipewire'
  'pango'
)
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b25f3f08dbb734eca6c87ce2b6f33296a88a29b38fbfda42773861348f1c388f')

prepare() {
  cd "TangleWire-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "TangleWire-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "TangleWire-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "TangleWire-$pkgver"
  install -Dm755 target/release/tanglewire "$pkgdir/usr/bin/tanglewire"
  install -Dm644 data/net.codefreak.TangleWire.desktop \
    "$pkgdir/usr/share/applications/net.codefreak.TangleWire.desktop"
  install -Dm644 data/net.codefreak.TangleWire.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.codefreak.TangleWire.svg"
  install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
