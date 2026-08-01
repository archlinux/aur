# Maintainer: Shiro836
#
# clodex — Claude Code routed to your ChatGPT/Codex subscription.
# Ships:
#   * clodex-proxy : forked Anthropic<->Codex proxy that reuses the existing
#                    ~/.codex/auth.json tokens (no separate login)
#   * clodex       : launcher that auto-starts the proxy and execs the
#                    unmodified Claude Code binary with scoped env vars
#
pkgname=clodex
pkgver=r6.81a0977
pkgrel=1
pkgdesc="claude-code-proxy wrapper using the Claude Code binary and Codex auth token"
arch=('x86_64')
url="https://github.com/Shiro836/clodex"
license=('MIT')
depends=('gcc-libs' 'bash' 'procps-ng')
makedepends=('rust' 'cargo' 'git')
optdepends=('codex: provides the ~/.codex login this reuses'
            'claude-code: the Claude Code CLI that clodex launches')
options=('!lto')
_gitsrc="clodex-src"
source=("$_gitsrc::git+https://github.com/Shiro836/clodex.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitsrc"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitsrc"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --bin claude-code-proxy
}

check() {
    cd "$srcdir/$_gitsrc"
    cargo test --release --locked --lib codex_cli_store
}

package() {
    cd "$srcdir/$_gitsrc"
    # Install the proxy under a clodex-specific name so nothing collides with
    # an upstream claude-code-proxy install.
    install -Dm755 "target/release/claude-code-proxy" "$pkgdir/usr/bin/clodex-proxy"
    install -Dm755 "packaging/clodex" "$pkgdir/usr/bin/clodex"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
