# Maintainer: Saiem Saeed <saiem.saeed7 at gmail dot com>

pkgname=sayall-git
pkgver=0.1.2.r1.g6d0f472
pkgrel=1
pkgdesc='Wayland voice dictation daemon and recording HUD (development version)'
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
makedepends=('cargo' 'git' 'pkgconf' 'python' 'zig')
provides=("sayall=$pkgver")
conflicts=('sayall' 'sayall-bin')
options=('!debug')
install='sayall-git.install'
source=("sayall::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sayall"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/sayall"
  export CARGO_HOME="$srcdir/cargo-home"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  cargo fetch --locked --manifest-path ui/linux/Cargo.toml
  zig build --fetch=all
}

build() {
  cd "$srcdir/sayall"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build -Doptimize=ReleaseFast -Dversion="$pkgver"
  cargo build --frozen --release --manifest-path ui/linux/Cargo.toml
}

check() {
  cd "$srcdir/sayall"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
  zig build test
  cargo test --frozen --manifest-path ui/linux/Cargo.toml
}

package() {
  local src="$srcdir/sayall"

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
