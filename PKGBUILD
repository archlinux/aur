# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=demongrep
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, local semantic code search powered by Rust"
arch=('x86_64')
url="https://github.com/yxanul/demongrep"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'rust' 'openssl' 'pkg-config')
# rust-lld cannot read the GCC LTO objects that cc produces for the bundled C sources
# (oniguruma, lmdb, tree-sitter), so the final link reports them as undefined symbols.
options=('!lto')
source=("$pkgname-$pkgver.crate::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('8efaa4de1f29f783869c275fc54b6bb8d2726b7a02f6534d462ba69e597a1e5b')

# crates.io answers 403 to curl's default User-Agent, so an identifying one is required.
latestver() {
    curl -fsSL -A "$pkgname/$pkgver (Arch Linux AUR version check)" \
        "https://crates.io/api/v1/crates/$pkgname" |
        jq -r '.crate.max_stable_version'
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
