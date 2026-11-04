# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.7.0
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo git)
source=($pkgname::git+https://github.com/protonpass/pass-cli.git#tag=$pkgver)
b2sums=('cc769a5d03112610686af8b32a8deaa0bb5bcedf2df53ebf39d60e579a0001b4a5e9535ca40b2174f9d955d23af9ce2c63cf79630f92f524909a48460c30c796')

prepare() {
    cd $pkgname

    sed -i '/uniffi-bindgen/d' Cargo.toml

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
}

build() {
    cd $pkgname

    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"

    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release

    for sh in bash zsh fish; do
        target/release/pass-cli completions $sh > pass-cli.$sh
    done
}

check() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd $pkgname
    install -Dm755 target/release/pass-cli -t "$pkgdir/usr/bin/"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm644 pass-cli.bash "$pkgdir/usr/share/bash-completion/completions/pass-cli"
    install -Dm644 pass-cli.zsh "$pkgdir/usr/share/zsh/site-functions/_pass-cli"
    install -Dm644 pass-cli.fish "$pkgdir/usr/share/fish/vendor_completions.d/pass-cli.fish"
}
