# Maintainer: jakeb-grant
pkgname=pane-fm-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A themeable file manager built with Tauri and Svelte"
arch=('x86_64')
url="https://github.com/jakeb-grant/hyprfiles"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
)
optdepends=(
    'udisks2: drive mounting from sidebar'
    'poppler: PDF preview (pdftoppm)'
    'nerd-fonts: file/folder icons'
    'inter-font: UI font'
)
makedepends=('cargo' 'bun' 'git' 'pkgconf')
provides=('pane-fm')
conflicts=('pane-fm')
source=("git+https://github.com/jakeb-grant/hyprfiles.git")
sha256sums=('SKIP')

pkgver() {
    cd hyprfiles
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd hyprfiles
    export RUSTUP_TOOLCHAIN=stable
    bun install --frozen-lockfile
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd hyprfiles
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    bun run sync-icons
    cargo build --frozen --release --manifest-path src-tauri/Cargo.toml
}

package() {
    cd hyprfiles
    install -Dm755 "src-tauri/target/release/pane-fm" "$pkgdir/usr/bin/pane-fm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

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
