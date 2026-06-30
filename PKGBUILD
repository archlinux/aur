# Maintainer: iSorensen
pkgname=wtcc
pkgver=0.6.0
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
sha256sums=('1d47e59b2ecf458fca3572210c2d8e86b9899e0ce8f74477f2963676d2b5060b')

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
