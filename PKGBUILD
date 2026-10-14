# Maintainer: sougstron
pkgname=kanban4ai
pkgver=0.8.1
pkgrel=1
pkgdesc='Native kanban board CLI and TUI driven by AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/sougstron/kanban4ai'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
  'tmux: attachable background agent sessions'
  'curl: subscription limits row for claude, grok, zai, synthetic; update checks and self-update'
  'libnotify: desktop notifications through notify-send'
  'wl-clipboard: paste images under Wayland'
  'xclip: paste images under X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f93dc6b32bbfe1132d25ed0982ae07b0404c7ee17d82a16a5be583e3583d763')

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
  install -Dm644 packaging/systemd/kanban4ai-serve.service \
    "$pkgdir/usr/lib/systemd/user/kanban4ai-serve.service"
  for hook in kanban4ai-sleep@.service kanban4ai-shutdown@.service; do
    install -Dm644 "packaging/systemd/$hook" "$pkgdir/usr/lib/systemd/system/$hook"
  done
}
