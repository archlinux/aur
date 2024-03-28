# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Jason Nader <jason d0t nader pr0t0nmail.c0m>

pkgname=cargo-cache
pkgver=0.8.3
pkgrel=2
pkgdesc="Display info and prune cargo cache"
arch=('x86_64')
url="https://github.com/matthiaskrgr/cargo-cache"
source=("$pkgname-$pkgver.tar.gz::https://github.com/matthiaskrgr/cargo-cache/archive/$pkgver.tar.gz")
license=('MIT' 'Apache-2.0')
depends=('cargo')
sha256sums=('d0f71214d17657a27e26aef6acf491bc9e760432a9bc15f2571338fcc24800e4')
depends=('libgit2')
makedepends=('cargo')

prepare() {
    cd "$pkgname-$pkgver"
    # Upstream tried to make libgit vendoring optional but it doesn't work. Manually implement it anyway.
    sed -i "s|\[\"vendored-libgit2\"\]|\[\]|" Cargo.toml
    sed -i "s|, \"vendored-libgit\"||" Cargo.toml
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/cargo-cache" "$pkgdir/usr/bin/cargo-cache"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}
