# Maintainer: Daniel Caixinha <2683004+dcaixinha@users.noreply.github.com>
pkgname=hyprlaser
pkgver=0.1.0
pkgrel=1
pkgdesc="A virtual laser pointer for Hyprland (Google-Slides-style red dot with motion trail)"
arch=('x86_64')
url="https://github.com/dcaixinha/hyprlaser"
license=('Apache-2.0')
depends=(
  # Hyprland is the only supported compositor — we use its IPC and assume
  # wlr-layer-shell. There's no point installing this otherwise.
  'hyprland'
  # libwayland-client.so — linked dynamically via wayland-backend's
  # client_system feature.
  'wayland'
  # Runtime Vulkan loader; wgpu picks an ICD through it.
  'vulkan-icd-loader'
)
makedepends=(
  'cargo'
  'pkgconf'
)
options=('!lto')  # cargo already handles thin-LTO via the [profile.release] in Cargo.toml
source=("$pkgname-$pkgver.tar.gz::https://github.com/dcaixinha/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
# NOTE: placeholder until the GitHub repository is made public. Once it is:
#   updpkgsums
# from this directory will replace SKIP with the real hash.
sha256sums=('61def7861e478f2036ed7e81f587e5660f6a1e88f1dbe3087910cf719f21760a')

prepare() {
  cd "$pkgname-$pkgver"
  # Fetch all deps into the local registry so the build step can run with
  # --frozen / --offline if a downstream packager prefers.
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # --frozen requires Cargo.lock to be present and unchanged (it is, we
  # commit it). It also implies --offline.
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
