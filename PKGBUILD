# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=tsfh-git
pkgver=0.74.0
pkgrel=1
pkgdesc="CHANGEME_DESC"
arch=('x86_64')
url="https://github.com/Obscurely/tsfh"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils')
provides=('tsfh-git')
conflicts=('tsfh-bin' 'tsfh')
source=('git+https://github.com/Obscurely/tsfh')
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
    strip target/release/tsfh
}

package() {
	cd "$srcdir/${pkgname%-git}"

    install -Dm755 target/release/tsfh -t "${pkgdir}/usr/bin/"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "resources/linux/desktop/tsfh.desktop"
    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
      install -Dm0644 "resources/linux/desktop/icons/hicolor/$size/apps/tsfh.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/tsfh.png"
    done
}
