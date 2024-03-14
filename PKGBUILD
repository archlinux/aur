# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=falion-git
pkgver=1.0.0
pkgrel=1
pkgdesc="An open source, programmed in rust, privacy focused tool for scraping programming resources (like stackoverflow) fast, efficient and asynchronous/parallel using the CLI or GUI. "
arch=('x86_64')
url="https://github.com/Obscurely/falion"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils')
provides=('falion-git')
conflicts=('falion-bin' 'falion')
source=('git+https://github.com/Obscurely/falion')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/${pkgname%-git}"
    cargo build --release --frozen
    strip target/release/falion
}

package() {
	cd "$srcdir/${pkgname%-git}"

    install -Dm755 target/release/falion -t "${pkgdir}/usr/bin/"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "resources/linux/desktop/falion.desktop"
    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
      install -Dm0644 "resources/linux/desktop/icons/hicolor/$size/apps/falion.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/falion.png"
    done
}
