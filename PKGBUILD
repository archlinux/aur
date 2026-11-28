# Maintainer: adelmonte
pkgname=file-browser-tui
pkgver=1.4.2
pkgrel=1
pkgdesc="A Dolphin-like file manager for kitty"
arch=('x86_64')
url="https://github.com/adelmonte/file-browser-tui"
license=('GPL-3.0-only')
depends=('kitty' 'gcc-libs' 'glibc' 'libarchive' 'librsvg' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=(
    'ttf-nerd-fonts-symbols: menu and toolbar glyphs'
    'wl-clipboard: the clipboard'
    'fd: searching by file name'
    'ripgrep: searching inside files'
    'ffmpeg: video thumbnails and audio cover art'
    'ffmpegthumbnailer: video thumbnails (preferred over ffmpeg when installed)'
    'poppler: PDF thumbnails'
    'xdg-utils: opening files with their default app'
    'zip: Compress to zip'
    'cryptsetup: unlocking encrypted drives'
    'kdeconnect: Send to Device and browsing phones over Wi-Fi'
    'glib2: file type icons for unusual files'
    'xdg-desktop-portal-tui: use as the Open and Save dialog for other programs'
)
install=file-browser-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3351eefe2e7f9cd588deafb31bcca64889d25b30ef677d7f2b7b3a2c38949f3')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm4755 "target/release/$pkgname-mount" "$pkgdir/usr/bin/$pkgname-mount"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
