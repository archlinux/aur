# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=octa
pkgver=0.7.0
pkgrel=1
pkgdesc="Multi-format data viewer/editor supporting parquet, csv, json, avro, xlsx and more"
arch=('x86_64')
url="https://github.com/thorstenfoltz/octa"
license=('MIT')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'openssl' 'fontconfig' 'freetype2' 'harfbuzz' 'fribidi' 'libjpeg-turbo' 'openjpeg2' 'gumbo-parser' 'jbig2dec' 'mujs')
makedepends=('rust' 'cargo' 'clang' 'cmake' 'nasm' 'pkgconf')
conflicts=('octa-bin')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6272b9113c354a868a48daf3c15c17cd1e620820f58e2d9dd309a23d4af477c8')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s/^version = .*/version = \"$pkgver\"/" Cargo.toml
    export RUSTUP_TOOLCHAIN=stable
    cargo update --workspace
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_BUILD_JOBS="$(nproc)"
    export MAKEFLAGS="-j$(nproc)"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/octa" "$pkgdir/usr/bin/octa"
    install -Dm644 "assets/octa.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/octa.svg"
    install -Dm644 "octa.desktop" "$pkgdir/usr/share/applications/octa.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
