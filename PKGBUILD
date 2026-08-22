# Maintainer: Daniel Araujo <contact@daniel-araujo.pt>
pkgname=yt-chanvids
pkgver=1.4.0
pkgrel=1
pkgdesc="Lists a YouTube channel's videos or looks up channel/video details"
arch=('x86_64')
url="https://github.com/daniel-araujo/yt-chanvids"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a16196394d6fddbf81697a66828dd1e4aaeb85eafe31c01cae6f818dd6f66b20')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
