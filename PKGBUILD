# Maintainer: sougstron
pkgname=kanban4ai
pkgver=0.5.5
pkgrel=1
pkgdesc='Native kanban board CLI and TUI driven by AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/sougstron/kanban4ai'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
  'tmux: attachable background agent sessions'
  'curl: subscription limits row for claude, grok, zai, synthetic, and yolo; update checks and self-update'
  'libnotify: desktop notifications through notify-send'
  'wl-clipboard: paste images under Wayland'
  'xclip: paste images under X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ec5c559a8134ae6a8f6d5f667fe0e904855f4fa6f7863acf3db5d87ac0c4986')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/kanban4ai "$pkgdir/usr/bin/kanban4ai"
  ln -s kanban4ai "$pkgdir/usr/bin/kanban"
  ln -s kanban4ai "$pkgdir/usr/bin/kb"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 AGENTS.md "$pkgdir/usr/share/doc/$pkgname/AGENTS.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/systemd/kanban4ai.service \
    "$pkgdir/usr/lib/systemd/user/kanban4ai.service"
}
