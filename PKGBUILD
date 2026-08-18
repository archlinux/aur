# Maintainer: Sean Pedersen
pkgname=marko-git
pkgver=4.20.0.r337.g7a3cf23
pkgrel=1
pkgdesc="A Tauri-based markdown editor with WYSIWYG inline editing"
arch=('x86_64' 'aarch64')
url="https://github.com/SeanPedersen/Marko"
license=('BSD-3-Clause')
options=('!lto')
depends=(
    'cairo'
    'dbus'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'dbus'
    'git'
    'libappindicator-gtk3'
    'librsvg'
    'nodejs'
    'openssl'
    'pkgconf'
    'pnpm'
)
provides=('marko')
conflicts=('marko')
source=("${pkgname}::git+https://github.com/SeanPedersen/Marko.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local ver=$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    if [[ -z "$ver" ]]; then
        local pkg_ver=$(sed -n 's/.*"version":[[:space:]]*"\([^"]*\)".*/\1/p' package.json | head -1)
        local rev_count=$(git rev-list --count HEAD)
        local short_hash=$(git rev-parse --short=7 HEAD)
        ver="${pkg_ver}.r${rev_count}.g${short_hash}"
    fi
    echo "$ver"
}

prepare() {
    cd "$pkgname"
    pnpm install --frozen-lockfile
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path src-tauri/Cargo.toml
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    pnpm build
    cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
    cd "$pkgname"

    # Install binary
    install -Dm755 "target/release/marko" "$pkgdir/usr/bin/marko"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/marko.desktop" <<EOF
[Desktop Entry]
Name=Marko
Comment=Simple Markdown viewer and text editor
Exec=marko %F
Icon=marko
Terminal=false
Type=Application
Categories=Office;TextEditor;
MimeType=text/markdown;text/plain;
StartupWMClass=marko
EOF

    # Install icons
    install -Dm644 "src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/marko.png"
    install -Dm644 "src-tauri/icons/64x64.png" \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/marko.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/marko.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/marko.png"
    install -Dm644 "src-tauri/icons/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/marko.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
