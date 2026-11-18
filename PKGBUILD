# Maintainer: Kaarel <github.com/kaareloun>
pkgname=kanbanana
pkgver=0.1.0
pkgrel=1
pkgdesc="Kanban board for your Linear issues, with Claude Code built in"
arch=('x86_64' 'aarch64')
url="https://github.com/kaareloun/kanbanana"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: file picker for attaching images'
            'claude-code: Claude Code integration over MCP')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02ebf3b3211b51321b0ed38b9852bdfa70ef6f9dcf9566533967f518550921e3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p kanbanana
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/kanbanana "$pkgdir/usr/bin/kanbanana"
  install -Dm644 assets/kanbanana.desktop "$pkgdir/usr/share/applications/kanbanana.desktop"
  install -Dm644 assets/brand/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/kanbanana.png"
  install -Dm644 assets/brand/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kanbanana.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
