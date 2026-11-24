# Maintainer: sougstron
pkgname=kanban4ai-git
pkgver=0.8.27.r1.g2458c69
pkgrel=1
pkgdesc='Native kanban board CLI and TUI driven by AI coding agents (Git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/sougstron/kanban4ai'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=(
  'tmux: attachable background agent sessions'
  'curl: subscription limits row for claude, grok, zai, synthetic; update checks and self-update'
  'libnotify: desktop notifications through notify-send'
  'wl-clipboard: paste images under Wayland'
  'xclip: paste images under X11'
)
provides=("kanban4ai=$pkgver")
conflicts=('kanban4ai')
source=('kanban4ai::git+https://github.com/sougstron/kanban4ai.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd kanban4ai
  printf '%s' "$(git describe --long --tags --abbrev=7 2>/dev/null || printf 'v0.1.0-0-g%s' "$(git rev-parse --short=7 HEAD)")" |
    sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd kanban4ai
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd kanban4ai
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

check() {
  cd kanban4ai
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd kanban4ai
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
