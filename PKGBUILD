# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

pkgname="neothesia"
_pkgname="Neothesia"
pkgver="0.5.0"
pkgrel=1
pkgdesc="Flashy Synthesia Like Software For Linux, Windows and MacOS"
arch=("x86_64")
url="https://polymeilex.github.io/Neothesia/"
license=("GPL")
makedepends=("rust" "clang")
depends=("ffmpeg")
source=("https://github.com/PolyMeilex/Neothesia/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f631324b3662e48dd98ea4b1b92452bd3336327eadf94e3efd1102b020f03b38')

prepare() {
    cp ../ffmpeg-encoder.patch "$srcdir/"
    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i ../ffmpeg-encoder.patch
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --bin neothesia
    cargo check -p neothesia-cli
    cargo build --release -p neothesia-cli
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-cli"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "flatpak/com.github.polymeilex.neothesia.desktop"
    # install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "flatpak/com.github.polymeilex.neothesia.metainfo.xml"
    install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" "flatpak/com.github.polymeilex.neothesia.png"
    install -Dm0644 -t "$pkgdir/usr/share/$pkgname/" "default.sf2"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/GPL" "LICENSE"
}
