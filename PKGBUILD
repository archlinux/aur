# Maintainer: qrafty-ai <contact@qrafty.ai>
pkgname=opencode-kanban
pkgver=0.6.3
pkgrel=1
pkgdesc="Terminal kanban board for managing OpenCode tmux sessions and Git worktrees"
arch=('x86_64' 'aarch64')
url="https://github.com/qrafty-ai/opencode-kanban"
license=('MIT')
depends=('tmux' 'sqlite')
makedepends=('rust' 'cargo' 'cmake' 'nasm' 'perl' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qrafty-ai/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d06892f05959d367e96c65b7149d5e2cb65af175e4750d6de4a7f8433dfa5982')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export OPENCODE_KANBAN_VERSION="$pkgver"
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export OPENCODE_KANBAN_VERSION="$pkgver"
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo test --frozen --lib 2>/dev/null || true
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
