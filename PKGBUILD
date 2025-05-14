# Maintainer: John Regan <john@jrjrtech.com>

pkgbase=lightningcss
pkgname=('lightningcss-cli') # future plans are to build nodejs modules etc
pkgver=1.30.1
pkgrel=1
pkgdesc='An extremely fast CSS parser, transformer, bundler, and minifier written in Rust.'
url='https://lightningcss.dev/'
arch=('i686' 'x86_64')
license=('MPL-2.0')
makedepends=('cargo')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/parcel-bundler/lightningcss/archive/v$pkgver.tar.gz")
sha256sums=('234c9c3ef0d8d59252cf64f36b53f49c8ca9d937f5301e501227c08ea4b6b7fe')

prepare() {
    cd "$pkgbase-$pkgver"
    cargo fetch --verbose --verbose --locked # --target "$(rustc -vV | sed -n 's/host: //p')"
    # removing platform filtering - during build cargo tries to download
    # platform-specific dependencies and throws an error, see:
    #   https://github.com/rust-lang/cargo/issues/12543
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=$(pwd)/target
    cargo build --features "cli" --release --frozen
}

check() {
    cd "$pkgbase-$pkgver"
    cargo test --features "cli" --frozen
}

package_lightningcss-cli() {
    pkgdesc='An extremely fast CSS parser, transformer, bundler, and minifier written in Rust - CLI'
    depends=('gcc-libs')

    cd "$pkgbase-$pkgver"
    install -Dm 755 "target/release/$pkgbase" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

