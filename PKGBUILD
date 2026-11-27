# Maintainer: enesehs <enesehs@protonmail.com>
pkgname=konvert-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Fast, lightweight, native right-click file converter and optimizer for Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/enesehs/konvert"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'ffmpeg' 'imagemagick')
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
provides=('konvert')
conflicts=('konvert')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/konvert-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/konvert-v$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('6a9bfa07e8ae20126f346e8799fac849b0575fc030098de04cce2ef35c1bb09b')
sha256sums_aarch64=('210d53eddf4aa36c26aed8dd2b874f8c838d5617aee425ef1144812669eeac8b')

package() {
    local pkg_dir="$srcdir/konvert-v${pkgver}-linux-${CARCH}"
    cd "$pkg_dir"

    install -Dm755 "konvert" "$pkgdir/usr/bin/konvert"
    install -Dm755 "konvert-settings" "$pkgdir/usr/bin/konvert-settings"
    install -Dm644 "io.github.enesehs.konvert.desktop" "$pkgdir/usr/share/applications/io.github.enesehs.konvert.desktop"
    install -Dm644 "packaging/io.github.enesehs.konvert.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.enesehs.konvert.metainfo.xml"
    install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/konvert.svg"
    install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.enesehs.konvert.svg"
    install -Dm644 "assets/icons/konvert-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/konvert-symbolic.svg"
    install -Dm644 assets/icons/*.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/actions/"
    install -Dm644 "packaging/konvert-mime.xml" "$pkgdir/usr/share/mime/packages/konvert-mime.xml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 docs/konvert.1 "$pkgdir/usr/share/man/man1/konvert.1"

    "./konvert" --completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/konvert"
    "./konvert" --completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_konvert"
    "./konvert" --completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/konvert.fish"

    mkdir -p "$pkgdir/usr/share/kio/servicemenus"
    "./konvert" --sync-menu --menu-dir "$pkgdir/usr/share/kio/servicemenus" --menu-exec "konvert"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus"/*.desktop
}
