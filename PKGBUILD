# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat
_pkgname=numbat-cli
pkgver=1.19.0
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
sha256sums=('2756f09827555627e9c5d4ab39edcb933ba1d617bd850821e4bdfb23f564f094'
            '8e4a55813417b5c7671d017475ffa645c0013eb98d44685c43fcf89addf2b1bf')
