# Maintainer: enesehs <enesehs@protonmail.com>
pkgname=konvert
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast, lightweight, native right-click file converter and optimizer for Linux (Dolphin, Nautilus, Nemo, Thunar)"
arch=('x86_64' 'aarch64')
url="https://github.com/enesehs/konvert"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'ffmpeg' 'imagemagick')
makedepends=('cargo' 'cmake' 'ninja' 'qt6-tools')
optdepends=(
    'dolphin: KDE Plasma file manager context menu integration'
    'nemo: Cinnamon file manager context menu integration'
    'thunar: XFCE file manager context menu integration'
    'nautilus: GNOME file manager script integration'
    'libjxl: JPEG XL (cjxl/djxl) support'
    'poppler: PDF page rendering to images (pdftoppm)'
    'ghostscript: PDF compression (gs)'
    'libreoffice-fresh: DOCX/UDF to PDF conversion (soffice)'
    'potrace: Vector tracing for SVG output'
    'oxipng: Lossless PNG optimization'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ba13cb5cb6256ff59d8e1b8f098d7bc5fa64b217114cdacf460fd3f12cd2ea8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
    cmake -B gui/build -S gui -GNinja -DCMAKE_BUILD_TYPE=Release
    ninja -C gui/build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/konvert" "$pkgdir/usr/bin/konvert"
    install -Dm755 "gui/build/konvert-settings" "$pkgdir/usr/bin/konvert-settings"
    install -Dm644 "io.github.enesehs.konvert.desktop" "$pkgdir/usr/share/applications/io.github.enesehs.konvert.desktop"
    install -Dm644 "packaging/io.github.enesehs.konvert.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.enesehs.konvert.metainfo.xml"
    install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/konvert.svg"
    install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.enesehs.konvert.svg"
    install -Dm644 "assets/icons/konvert-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/konvert-symbolic.svg"
    install -Dm644 assets/icons/*.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/actions/"
    install -Dm644 "packaging/konvert-mime.xml" "$pkgdir/usr/share/mime/packages/konvert-mime.xml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 docs/konvert.1 "$pkgdir/usr/share/man/man1/konvert.1"

    # Shell completions
    "target/release/konvert" --completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/konvert"
    "target/release/konvert" --completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_konvert"
    "target/release/konvert" --completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/konvert.fish"

    # Install system-wide Dolphin servicemenus
    mkdir -p "$pkgdir/usr/share/kio/servicemenus"
    "target/release/konvert" --sync-menu --menu-dir "$pkgdir/usr/share/kio/servicemenus" --menu-exec "konvert"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus"/*.desktop
}
