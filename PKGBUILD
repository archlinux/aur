# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat
_pkgname=numbat-cli
pkgver=1.16.0
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

sha256sums=(
  '086ec2fb192c21dd117b75725136763136eb8ba0bd4326d4500c9ff71a153268'
  '33f3744a31f62f7ebd985c6b3ec3c6a6d6f897527e8db5bc2de48dd299a63cdd'
)

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
