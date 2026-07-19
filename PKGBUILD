# Maintainer: VisorCraft LLC <packages@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: 0BSD

pkgname=realistic-mouse-jiggler
pkgver=0.4.1
pkgrel=1
pkgdesc="Cross-platform desktop mouse jiggler with realistic motion, tray controls, and global bindings"
arch=('x86_64')
url="https://github.com/visorcraft/realistic-mouse-jiggler"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libxkbcommon')
makedepends=('cargo')
optdepends=(
  'ydotool: preferred cursor movement backend on Wayland'
  'systemd: run the ydotool user service on Wayland'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef9f4bf88904df00c0d1cf9701ebd6d3d251a75185e3ba72fce514fa1a9b8a3e')

prepare() {
  cd "$pkgname-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export CARGO_INCREMENTAL=0
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export CARGO_INCREMENTAL=0
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 \
    packaging/linux/com.visorcraft.realistic-mouse-jiggler.desktop \
    "$pkgdir/usr/share/applications/com.visorcraft.realistic-mouse-jiggler.desktop"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 \
      "assets/icons/rmj-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.visorcraft.realistic-mouse-jiggler.png"
  done
}
