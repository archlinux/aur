# Maintainer: Craig McLure <craig@mclure.net>
pkgname=goxlr-utility-ui
pkgver=0.0.6
pkgrel=4
pkgdesc="A UI Wrapper for the GoXLR Utility"
arch=('x86_64')
url="https://github.com/GoXLR-on-Linux/goxlr-utility-ui-wrapper-app"
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
	'gstreamer'
	'gst-plugins-good'
	'goxlr-utility>=0.12.0'
)
makedepends=('cargo' 'pkgconf' 'clang')
source=("goxlr-utility-ui-wrapper-app-$pkgver.tar.gz::https://github.com/GoXLR-on-Linux/goxlr-utility-ui-wrapper-app/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('359ee7c6754f6072b4a417bdacf9bc0dde4231da87ed4b9906d0b0e027fee85fe5d3331ffe6f34156b125bbe6282d7521f05f09ea2c97e0323292317a42a0b95')

prepare() {
    cd "goxlr-utility-ui-wrapper-app-$pkgver/src-tauri"

    # Don't lock the fetch, Cargo.lock isn't present in the repository
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}

build() {
    cd "goxlr-utility-ui-wrapper-app-$pkgver/src-tauri"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "goxlr-utility-ui-wrapper-app-$pkgver/src-tauri"
    cargo test --release --frozen
}

package() {
    cd "goxlr-utility-ui-wrapper-app-$pkgver"

    install -Dm755 "src-tauri/target/release/goxlr-utility-ui" "$pkgdir/usr/bin/goxlr-utility-ui"
    install -Dm644 "ci/resources/goxlr-utility-ui.desktop" "$pkgdir/usr/share/applications/goxlr-utility-ui.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
