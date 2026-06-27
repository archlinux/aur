# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.2.0
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url='https://protonpass.github.io/pass-cli/'
license=(GPL-3.0-or-later)
depends=(glibc libgcc openssl)
makedepends=(cargo)
source=(https://github.com/protonpass/pass-cli/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('45fa51bbabe7a3ce90c33b13147dc43c4c16114a0f403e4c7213797fdafae4eee6a2147d3f7b3968c6127f58b3137a2867f45eb77aee8ee358866cc6de2eecd2')

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
    # Link to system OpenSSL
    export OPENSSL_NO_VENDOR=1

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
