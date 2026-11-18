# Maintainer: Kaarel <github.com/kaareloun>
pkgname=kanbanana
pkgver=0.1.5
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
sha256sums=('56ce2053a3dd17ff7310225b16e19150792e81078723e5d4919359e4a6ffa519')

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
  for s in 32 48 64 128 256 512; do
    install -Dm644 "assets/brand/icons/kanbanana-$s.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/kanbanana.png"
  done
  install -Dm644 assets/brand/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kanbanana.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
