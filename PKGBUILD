# Maintainer: John Regan <john@jrjrtech.com>

pkgname=lightningcss
pkgver=1.29.2
pkgrel=1
pkgdesc='An extremely fast CSS parser, transformer, bundler, and minifier written in Rust.'
url='https://lightningcss.dev/'
arch=('i686' 'x86_64')
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/parcel-bundler/lightningcss/archive/v$pkgver.tar.gz")
sha256sums=('f867c0341a25e7ec03ec20287f060e11f948072ff9c66b4fcfdb44e6b6251ef0')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --verbose --verbose --locked # --target "$(rustc -vV | sed -n 's/host: //p')"
    # removing platform filtering - during build cargo tries to download
    # platform-specific dependencies and throws an error, see:
    #   https://github.com/rust-lang/cargo/issues/12543
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --features "cli" --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --features "cli" --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

