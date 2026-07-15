# Maintainer: sougstron
pkgname=kanban4ai
pkgver=0.2.3
pkgrel=1
pkgdesc='Native kanban board CLI and TUI driven by AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/sougstron/kanban4ai'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
  'tmux: attachable background agent sessions'
  'libnotify: desktop notifications through notify-send'
  'wl-clipboard: paste images under Wayland'
  'xclip: paste images under X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25c3682596295620d886f9a8f015f85b086cd0c94321331fcda4fe88088f7548')

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
}
