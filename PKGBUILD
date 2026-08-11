# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.3.0
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo git)
source=($pkgname::git+https://github.com/protonpass/pass-cli.git#tag=$pkgver)
b2sums=('654232cc5b8be29b1072518f9ea9c7972219d3a84330491a39927acffa30bd6a85b353e5a8811a0e79d6ea97d3c1427f94e657d5eeeb563e09812f9ed15db5ba')

prepare() {
    cd $pkgname
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
