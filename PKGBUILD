# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.3.3
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo git)
source=($pkgname::git+https://github.com/protonpass/pass-cli.git#tag=$pkgver)
b2sums=('ccd700790c2647902396ff537c67e9847d2963ba3d091ee214d4a3360667d6bdc110bdf05e46db8137e6cca45847171be0dbcf66244d87975288f2378e2fcda7')

prepare() {
    cd $pkgname

    # Workaround for query overflow depth limit on nested async fns
    # https://github.com/rust-lang/rust/issues/152942
    sed -i '19i #![recursion_limit = "256"]' pass-cli/src/main.rs pass/src/lib.rs

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
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
