# Maintainer: adelmonte
pkgname=file-browser-tui
pkgver=1.1.5
pkgrel=1
pkgdesc="A Dolphin-like file manager for kitty"
arch=('x86_64')
url="https://github.com/adelmonte/file-browser-tui"
license=('GPL-3.0-only')
depends=('kitty' 'gcc-libs' 'glibc' 'libarchive' 'librsvg' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=(
    'ttf-nerd-fonts-symbols: menu and toolbar glyphs'
    'wl-clipboard: clipboard on Wayland'
    'xclip: clipboard on X11'
    'fd: searching by file name'
    'ripgrep: searching inside files'
    'ffmpeg: video thumbnails and audio cover art'
    'ffmpegthumbnailer: video thumbnails (preferred over ffmpeg when installed)'
    'poppler: PDF thumbnails'
    'xdg-utils: opening files with their default app'
    'zip: Compress to zip'
    'udisks2: mounting, unlocking and safely removing drives'
    'kdeconnect: Send to Device and browsing phones'
    'glib2: file type icons for unusual files'
    'xdg-desktop-portal-tui: use as the Open and Save dialog for other programs'
)
install=file-browser-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d84002a5d52ed3dff1509a846819675138761b9d47e4c876ebb8216dcf726880')

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
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
