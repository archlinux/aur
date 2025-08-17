# Maintainer: Altynbek Orumbayev <aorumbayev@pm.me>
# 
# This is the source package for awesome-omarchy-tui, which builds the application 
# from source using the Rust toolchain. For a binary package (pre-compiled), 
# see awesome-omarchy-tui-bin.
#
# NOTE: The updater feature is intentionally disabled for AUR packages since
# package managers (pacman/AUR) should handle updates, not the application itself.
# This ensures consistency with standard Linux package management practices.

pkgname=awesome-omarchy-tui
pkgver=0.3.10
pkgrel=1
pkgdesc="A beautiful terminal UI for browsing the awesome-omarchy repository with search, navigation, and GitHub integration"
arch=('x86_64')
url="https://github.com/aorumbayev/awesome-omarchy-tui"
license=('MIT')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aorumbayev/awesome-omarchy-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('511601aba3c0645253c1e630badf14b847e86e22d7ed820adb41dd9b63d410b6')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Build without default features to exclude the updater feature
    # This allows package managers to handle updates instead of the application
    cargo build --frozen --release --no-default-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    # Test without default features to match the build configuration
    cargo test --frozen --release --no-default-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/awsomarchy"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
