# Maintainer: Saiem Saeed <saiem.saeed7 at gmail dot com>

pkgname=sayall
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland voice dictation daemon and recording HUD'
arch=('x86_64')
url='https://github.com/saiemsaeed/sayall'
license=('MIT')
depends=(
  'ca-certificates'
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'libnotify'
  'pipewire-audio'
  'wl-clipboard'
  'wtype'
)
makedepends=('cargo' 'pkgconf' 'python' 'zig')
conflicts=('sayall-bin' 'sayall-git')
options=('!debug')
install='sayall.install'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'websocket.zig-b70e733.tar.gz::https://github.com/karlseguin/websocket.zig/archive/b70e733bc0d0ba0a98ff5fe5ef64d3017c85f369.tar.gz'
)
sha256sums=(
  'e7aa6de8bc8fd93aa1199ed8258cd7ff5bc2a945d6f2cde3302bf43585930ed6'
  '55e6b7d11c61a81bcf7482578e460da78719459dd4c8370f52033229ae529fe9'
)

prepare() {
  cd "$srcdir/sayall-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  ln -sfn 'websocket.zig-b70e733bc0d0ba0a98ff5fe5ef64d3017c85f369' "$srcdir/websocket.zig"
  sed -i '/        .websocket = .{/,/        },/c\        .websocket = .{ .path = "../websocket.zig" },' build.zig.zon
  cargo fetch --locked --manifest-path ui/linux/Cargo.toml
}

build() {
  cd "$srcdir/sayall-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Doptimize=ReleaseFast
  cargo build --frozen --release --manifest-path ui/linux/Cargo.toml
}

check() {
  cd "$srcdir/sayall-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build test
  cargo test --frozen --manifest-path ui/linux/Cargo.toml
}

package() {
  local src="$srcdir/sayall-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" \
    "$src/zig-out/bin/sayall" \
    "$srcdir/cargo-target/release/sayall-hud"

  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" \
    "$src/sayall.service" \
    "$src/sayall-hud.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' \
    "$pkgdir/usr/lib/systemd/user/sayall.service" \
    "$pkgdir/usr/lib/systemd/user/sayall-hud.service"

  install -Dm644 -t "$pkgdir/usr/share/doc/sayall" \
    "$src/README.md" \
    "$src/CHANGELOG.md"
  install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$src/licenses/websocket.zig-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/websocket.zig-LICENSE"
  (
    cd "$src"
    CARGO_HOME="$srcdir/cargo-home" CARGO_NET_OFFLINE=true \
      python scripts/third-party-licenses.py \
      "$pkgdir/usr/share/licenses/$pkgname/RUST-THIRD-PARTY-LICENSES.txt"
  )
}
