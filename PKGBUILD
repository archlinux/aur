# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.5.1
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo git)
source=($pkgname::git+https://github.com/protonpass/pass-cli.git#tag=$pkgver)
b2sums=('d870d246fcce5659e11b2402952a789adf0b45835013fa18b02a961fc4e077712469edfa7d1f011a18c6d84831491ac0633c71b7aff7be364ee61d39d91849a3')

prepare() {
    cd $pkgname

    # Workaround for query overflow depth limit on nested async fns
    # https://github.com/rust-lang/rust/issues/152942
    sed -i '19i #![recursion_limit = "256"]' pass-cli/src/main.rs pass/src/lib.rs

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
