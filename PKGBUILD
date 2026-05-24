# Maintainer: 张祥临 <MiniPikka at github dot com>

pkgname=banban
pkgver=0.1.4
pkgrel=1
pkgdesc="Rotating shift schedule CLI + TUI — 17 commands, HTTP API, DBus daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/MiniPikka/SimpleShiftScheduler"
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
provides=('banban')
conflicts=('banban-bin' 'banban-git')
source=("shift-cli-${pkgver}.tar.gz::https://static.crates.io/crates/shift-cli/shift-cli-${pkgver}.crate")
sha256sums=('SKIP')

prepare() {
    cd "shift-cli-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "shift-cli-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "shift-cli-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "shift-cli-${pkgver}"

    # Binary
    install -Dm755 "target/release/banban" "$pkgdir/usr/bin/banban"

    # Shell completions — generate to temp files to avoid bash <() dependency
    ./target/release/banban completions bash > /tmp/banban-compl.bash
    ./target/release/banban completions zsh  > /tmp/banban-compl.zsh
    ./target/release/banban completions fish > /tmp/banban-compl.fish

    install -Dm644 /tmp/banban-compl.bash "$pkgdir/usr/share/bash-completion/completions/banban"
    install -Dm644 /tmp/banban-compl.zsh  "$pkgdir/usr/share/zsh/site-functions/_banban"
    install -Dm644 /tmp/banban-compl.fish "$pkgdir/usr/share/fish/vendor_completions.d/banban.fish"

    rm -f /tmp/banban-compl.{bash,zsh,fish}

    # License declared via license=('MIT') in metadata; tarball lacks standalone LICENSE file
}
