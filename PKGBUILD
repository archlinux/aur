# Maintainer: qrafty-ai <contact@qrafty.ai>
pkgname=opencode-kanban
pkgver=0.4.8
pkgrel=1
pkgdesc="Terminal kanban board for managing OpenCode tmux sessions and Git worktrees"
arch=('x86_64' 'aarch64')
url="https://github.com/qrafty-ai/opencode-kanban"
license=('MIT')
depends=('tmux' 'sqlite')
makedepends=('rust' 'cargo' 'cmake' 'nasm' 'perl' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qrafty-ai/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eff8a52a7a8033403f6a7f057733683e76fd0e9bb426a503ddd47c6e6c1d4fc3')

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
