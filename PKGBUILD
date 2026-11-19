# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.7.1
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo git)
source=($pkgname::git+https://github.com/protonpass/pass-cli.git#tag=$pkgver)
b2sums=('7ea205f4b82e4cf6acecb5b8ce00f74a2716ce879ce8c5cbf565ab6099ba504ee72d961e550ff6973504ab91e2a4f3050f82cb1162bd2e566a7629584e216123')

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
