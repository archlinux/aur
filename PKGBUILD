# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat
_pkgname=numbat-cli
pkgver=1.18.0
pkgrel=1
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('any')
url="https://github.com/sharkdp/numbat"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=(cargo)
provides=(numbat)
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate"
  "v$pkgver::https://github.com/sharkdp/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
options=(!lto)

prepare() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    cargo doc
}

#check() {
#    cd $_pkgname-$pkgver
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname-$pkgver/target/release/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r  "$pkgname-$pkgver/$pkgname/modules" "$pkgdir/usr/share/$pkgname/"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "$pkgname-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/doc/$pkgname/README.md"
    install -Dm644 "$pkgname-$pkgver/assets/numbat.desktop" "$pkgdir/usr/share/applications/numbat.desktop"
    install -Dm644 "$pkgname-$pkgver/assets/numbat.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/numbat.svg"

    for icon in $(ls $pkgname-$pkgver/assets/numbat-*x*.png)
    do
      filename_without_prefix=${icon#*-}
      icon_size=${filename_without_prefix%.*}
      install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$icon_size/apps/numbat.png"
    done
}
sha256sums=('34cfc33ab696ab57eb66ec4800a58cac7082bd5715d6f2b2684929319a7b979e'
            '29ebaf622dfb0c1ed142572f4a0a9a5a546b9b2d51149260ff64078ed4c233cb')
