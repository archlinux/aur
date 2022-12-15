# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=estash-git
pkgver=0.6.2.11.ga786870
pkgrel=1
pkgdesc="An open source, cross-platform, programmed in rust, encrypted digital vault (store files and text) with the capability to set a path and with the click of a button to copy the contents to that file."
arch=('x86_64')
url="https://github.com/Obscurely/EStash"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils' 'libx11' 'libxext' 'libxft' 'libxinerama' 'libxcursor' 'libxrender' 'libxfixes' 'pango' 'cairo' 'libgl' 'mesa')
provides=('estash-git')
conflicts=('estash-bin' 'estash')
source=('git+https://github.com/Obscurely/estash')
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
    strip target/release/estash
}

package() {
	cd "$srcdir/${pkgname%-git}"

    install -Dm755 target/release/estash -t "${pkgdir}/usr/bin/"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/EStash.desktop"
    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
      install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/estash.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/estash.png"
    done
}
