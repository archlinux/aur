# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

pkgname="neothesia"
_pkgname="Neothesia"
pkgver="0.2.0"
pkgrel=1
pkgdesc="Flashy Synthesia Like Software For Linux, Windows and MacOS"
arch=("x86_64")
url="https://polymeilex.github.io/Neothesia/"
license=("GPL")
depends=("rust" "ffmpeg" "clang")
source=("https://github.com/PolyMeilex/Neothesia/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80d27fc62daabd909df8184b60506331f5c9d14ffcbaf046ab7281d46146b06f')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/GPL" "LICENSE"
}