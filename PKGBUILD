# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.2.5
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url=https://protonpass.github.io/pass-cli
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlcipher)
makedepends=(cargo)
source=(https://github.com/protonpass/pass-cli/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('bda843c285353eaf7c050af05350d2321d50bc088e0d42870fde1159b3aac98d677b9805c45278468ea9cdb20ff453d33a5afe9ca2f339db34680410f1720daa')

prepare() {
    cd pass-cli-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd pass-cli-$pkgver

    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"

    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

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
