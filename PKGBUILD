# Maintainer: Kristofers Solo <aur at kristofers dot xyz>
pkgname=mekle-git
pkgver=0.2.0.r104.g25a4c52
pkgrel=1
pkgdesc='Fast project discovery tool for developers (Git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/kristoferssolo/mekle'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=('mekle')
conflicts=('mekle' 'mekle-bin')
install=mekle.install
source=('mekle::git+https://github.com/kristoferssolo/mekle.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd mekle
    local version
    version="$(sed -n '/^\[package\]/,/^\[/{s/^version = "\([^"]*\)"/\1/p;}' Cargo.toml | head -n 1)"
    printf '%s.r%s.g%s\n' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd mekle
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd mekle
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin mekle
}

check() {
    cd mekle
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd mekle
    install -Dm755 target/release/mekle "$pkgdir/usr/bin/mekle"
    install -Dm644 config/config.toml "$pkgdir/usr/share/mekle/config.toml"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
