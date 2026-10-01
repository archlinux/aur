# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.4.2
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo git)
source=($pkgname::git+https://github.com/protonpass/pass-cli.git#tag=$pkgver)
b2sums=('d4a7efb19cdd11820999e80f8f36eb478539c2442b06c0f27718bf54ace3213a9f491308f7c5cbf203f915a2811a6e6e1c9aa134337b1655c4b104e68d203939')

prepare() {
    cd $pkgname

    # Workaround for query overflow depth limit on nested async fns
    # https://github.com/rust-lang/rust/issues/152942
    sed -i '19i #![recursion_limit = "256"]' pass-cli/src/main.rs pass/src/lib.rs

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
}
