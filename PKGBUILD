# Maintainer: iSorensen
pkgname=wtcc
pkgver=0.8.2
pkgrel=1
pkgdesc="WorkTree Command Center — a TUI for running Claude Code agents across git worktrees"
arch=('x86_64')
url="https://github.com/isorensen/wtcc"
license=('MIT')
depends=('git' 'tmux')
optdepends=('github-cli: per-worktree PR/CI status badges'
            'claude-code: the coding agent launched in each worktree')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba7f78309aab832257c788c276ad91be4e81abe5e7d5aa55a94f806e3d91e57c')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
