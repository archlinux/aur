# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.1.2
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url='https://protonpass.github.io/pass-cli/'
license=(GPL-3.0-or-later)
depends=(glibc libgcc)
makedepends=(cargo)
source=(https://github.com/protonpass/pass-cli/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('11d0bc21004fbc0c8b022ed28a2edf61a0fb5517e228ae7657668c72581153ea0334a0e1410bf0b83dbc4da7c50e3ae07d11b6567f7f7d8b1cd8d46c38116046')

prepare() {
    cd pass-cli-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd pass-cli-$pkgver

    # Fix LTO incompatibility
    export CFLAGS="${CFLAGS} -ffat-lto-objects"
    export CXXFLAGS="${CXXFLAGS} -ffat-lto-objects"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release
}

check() {
    cd pass-cli-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd pass-cli-$pkgver
    install -Dm755 target/release/pass-cli -t "$pkgdir/usr/bin/"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
}
