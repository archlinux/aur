# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-pass-cli
pkgver=2.1.3
pkgrel=1
pkgdesc='A command-line interface for Proton Pass'
arch=(aarch64 x86_64)
url='https://protonpass.github.io/pass-cli/'
license=(GPL-3.0-or-later)
depends=(glibc libgcc)
makedepends=(cargo)
source=(https://github.com/protonpass/pass-cli/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('0c54f1d67e4a03b7215bc3cb2b23fcaab99ebed1cbb69da7b5faea22f4c0d2fcf375e9e39da81a51c0f64ddd570aec44a8886b43c90bc5195c7791a7ec42efc9')

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
