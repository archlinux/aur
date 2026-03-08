# Maintainer: Evan Dunbar <evdunbar _ protonmail _ com>
# Maintainer: Luke Street <luke@street.dev>
pkgname="objdiff"
pkgver=3.7.0
pkgrel=1
pkgdesc="A local diffing tool for decompilation projects"
arch=("x86_64")
url="https://github.com/encounter/$pkgname"
license=("Apache-2.0 OR MIT")
depends=(
    "fontconfig"
    "freetype2"
)
makedepends=("cargo")
conflicts=("$pkgname")
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
    "$pkgname.png"
)
b2sums=(
    "b151c8bd07205bb97382c4aea49dcfa86fcaf2104f3e5c4184d7d398b5b5d0b04093694ce58d3549379a3ec624f2fc00c4d10733f3b5c38cc25db393f5e8d594"
    "SKIP"
    "SKIP"
)
options=(!strip !lto !debug)

prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build () {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo build --release --target-dir="target"
}

package () {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname-cli" -t "$pkgdir/usr/bin/"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname-$pkgver/LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
