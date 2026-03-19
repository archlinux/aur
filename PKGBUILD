# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-tui-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Minecraft P2P multiplayer tunnel TUI client (git version)"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
provides=('sculk-tui' 'sckt')
conflicts=('sculk-tui-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd sculk
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

prepare() {
    cd sculk
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd sculk
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p sculk-tui
}

package() {
    install -Dm755 "sculk/target/release/sckt" "${pkgdir}/usr/bin/sckt"
}
