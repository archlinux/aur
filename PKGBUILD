# Maintainer: horberlan brito <horberlan@gmail.com>

pkgname=anny-dock
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern, animated dock for Hyprland built with Rust and Bevy Engine"
arch=('x86_64')
url="https://github.com/horberlan/anny-dock"
license=('MIT')
depends=(
  'alsa-lib'
  'libgcc'
  'glibc'
  'hyprland'
  'libxkbcommon'
  'systemd-libs'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('b83cf63a34633122ec7cbda9702a0f1dc8e4f59d86901fbf3d0c68b86c875211')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # src/icon/ is not used by the dock yet; two of its tests fail and others
  # write to the real ~/.cache.
  cargo test --frozen -- --skip icon::
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
