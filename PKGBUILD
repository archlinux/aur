# Maintainer: Craig McLure <craig@mclure.net>
pkgname=goxlr-utility-ui
pkgver=0.0.4
pkgrel=2
pkgdesc="A UI Wrapper for the GoXLR Utility"
arch=('x86_64')
url="https://github.com/frostycoolslug/goxlr-utility-ui"
license=('MIT')

## Some of these are technically provided by single packages, but in the interest of completeness, and
## in case the dependencies change in the future, list them all.
depends=(
	'libgtk-3.so'
	'libwebkit2gtk-4.1.so'
	'libjavascriptcoregtk-4.1.so'
	'libcairo.so'
	'libcairo-gobject.so'
	'libsoup-3.0.so'
	'libgdk_pixbuf-2.0.so'
	'libpango-1.0.so'
	'goxlr-utility>=0.12.0'
)
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/frostycoolslug/goxlr-utility-ui/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('98205cd2a79d09cd045829f7594675469661030bf8841b6c9cb427a06cc0be099f821b008f4753f6ecd4e9b8ac57ef6870777e2cff505720a1c27bab185e214b')

prepare() {
    cd "$pkgname-$pkgver/src-tauri"

    # Don't lock the fetch, Cargo.lock isn't present in the repository
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver/src-tauri"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver/src-tauri"
    cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "src-tauri/target/release/goxlr-utility-ui" "$pkgdir/usr/bin/goxlr-utility-ui"
    install -Dm644 "ci/resources/goxlr-utility-ui.desktop" "$pkgdir/usr/share/applications/goxlr-utility-ui.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
