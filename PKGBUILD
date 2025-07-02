# Maintainer: rocksalt
pkgname=nvcards
pkgver=0.29.0
pkgrel=3
pkgdesc="Card-based note-taking application with local database file (sqlite database with egui frontend)"
arch=('x86_64')
url="https://gitlab.com/nacl42/nvcards"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/nacl42/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('6927d10cad8f6753a3a8b32233f022c9d009fb49eb41ac7dd18c0cd223ff6428')

_features="pdf,json_tree,jp_font,inter_font"

prepare() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features="$_features"
}

check() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --features="$_features"
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 resources/linux/nvcards.png "$pkgdir/usr/share/pixmaps/nvcards.png"
    install -Dm0644 resources/linux/nvcards.desktop "$pkgdir/usr/share/applications/nvcards.desktop"
    install -Dm0644 resources/linux/nvcards.1 "$pkgdir/usr/share/man/man1/nvcards.1"
    install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}