# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=rawbit
pkgver=0.1.18
pkgrel=1
pkgdesc='A camera RAW photo preprocessor and importer'
arch=(x86_64 aarch64)
url="https://github.com/cartercanedy/rawbit"
license=(MIT)
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo)
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f2b2fa0becea9ad2d73f7494b5227c8f35857a5ef1f4de376d9f796cdb39a162')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features --workspace
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/rawbit" -t "$pkgdir/usr/bin" 
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
