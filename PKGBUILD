# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-git
pkgver=0.5.0
pkgrel=1
pkgdesc="Minecraft P2P multiplayer tunnel CLI (git version)"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('MIT' 'Apache-2.0')
makedepends=('cargo' 'git')
provides=('sculk' 'sculk-cli')
conflicts=('sculk' 'sculk-bin' 'sculk-cli-bin' 'sculk-cli-git')
replaces=('sculk-cli-git')
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
    cargo build --frozen --release -p sculk-cli
}

package() {
    install -Dm755 "sculk/target/release/sculk" "${pkgdir}/usr/bin/sculk"
}
