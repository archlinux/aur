# Maintainer: jakeb-grant
pkgname=pane-fm-git
pkgver=0.1.9.r0.gcd5cda0
pkgrel=1
pkgdesc="A themeable file manager built with Tauri and Svelte"
arch=('x86_64')
url="https://github.com/jakeb-grant/pane-fm"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
)
optdepends=(
    'zstd: .tar.zst archive support'
    'udisks2: drive mounting from sidebar'
    'poppler: PDF preview (pdftoppm)'
    'nerd-fonts: file/folder icons'
    'inter-font: UI font'
)
makedepends=('cargo' 'bun' 'git')
provides=('pane-fm')
conflicts=('pane-fm')
source=("git+https://github.com/jakeb-grant/pane-fm.git")
sha256sums=('SKIP')

pkgver() {
    cd pane-fm
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd pane-fm
    export RUSTUP_TOOLCHAIN=stable
    bun install --frozen-lockfile
    bun run sync-icons
    bun tauri build --no-bundle
}

package() {
    cd pane-fm
    install -Dm755 "src-tauri/target/release/pane-fm" "$pkgdir/usr/bin/pane-fm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # App icon
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pane-fm.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pane-fm.png"
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/pane-fm.png"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pane-fm.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=pane-fm
Comment=A themeable file manager
Exec=pane-fm %U
Icon=pane-fm
Terminal=false
Categories=System;FileTools;FileManager;
MimeType=inode/directory;
EOF
}
