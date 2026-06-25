# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale
pkgver=4.0.2
pkgrel=1
pkgdesc='CLI tool and TUI for tracking token usage and costs from AI coding agents'
arch=('x86_64')
url='https://github.com/junhoyeo/tokscale'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'openssl' 'pkg-config')
provides=('tokscale')
conflicts=('tokscale-bin' 'tokscale-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/junhoyeo/tokscale/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('da7368883a55338db600efc9210a1a0d21b4436d3d1f1f4fec61114556980e01cfdd2078ef185f0d5b0a6771ac6cfcb0d24811fec22a66b2b7c38549f4fdc912')
options=(!lto)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/native-tls-vendored/native-tls/g' Cargo.toml crates/*/Cargo.toml
    cargo fetch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS='-C linker-features=-lld -C link-arg=-Wl,--copy-dt-needed-entries'
    cargo build --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS='-C linker-features=-lld -C link-arg=-Wl,--copy-dt-needed-entries'
    cargo test --workspace
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
