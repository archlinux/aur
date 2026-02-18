# Maintainer: qrafty-ai <contact@qrafty.ai>
pkgname=opencode-kanban
pkgver=0.0.10
pkgrel=1
pkgdesc="Terminal kanban board for managing OpenCode tmux sessions and Git worktrees"
arch=('x86_64' 'aarch64')
url="https://github.com/qrafty-ai/opencode-kanban"
license=('MIT')
depends=('tmux' 'sqlite')
makedepends=('rust' 'cargo' 'cmake' 'nasm' 'perl' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qrafty-ai/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f2bb68d23b8536c0ef4fa6d65826fd0be6ae081c704fdd1779ef23524edb7f0')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc
    cargo test --frozen --lib 2>/dev/null || true
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
