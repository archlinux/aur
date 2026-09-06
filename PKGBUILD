# Maintainer: imm <40186+imm@users.noreply.github.com>

pkgname=scratch-notes
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimalist, offline-first markdown note-taking app'
arch=('x86_64')
url='https://github.com/erictli/scratch'
license=('MIT')
depends=(
    'cairo'
    'gdk-pixbuf2'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'webkit2gtk-4.1'
)
makedepends=('cargo' 'npm')
options=('!lto')
source=("scratch-$pkgver.tar.gz::https://github.com/erictli/scratch/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('996dda6e36bca4a734ada0761a340d46d9afed38c020816310653b29bf070f9f89ac95b7ca72804c3ec5629d431a559f8ef6be4f107f8631fefe1db8066a055a')

build() {
    cd "scratch-$pkgver"

    npm ci
    npm run build

    cd src-tauri
    # custom-protocol embeds the frontend assets; without it the app runs in
    # dev mode and the webview tries to load http://localhost:1420
    cargo build --release --locked --features tauri/custom-protocol
}

package() {
    cd "scratch-$pkgver"

    install -Dm755 src-tauri/target/release/Scratch "$pkgdir/usr/bin/$pkgname"

    cd src-tauri/icons
    install -Dm644 32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -Dm644 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 '128x128@2x.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    cd ../..

    # Upstream declares MIT in the README but ships no LICENSE file
    install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README"

    cat > "$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Scratch
GenericName=Markdown Notes
Comment=Minimalist, offline-first markdown note-taking app
Exec=scratch-notes %F
Icon=scratch-notes
Terminal=false
Categories=Office;TextEditor;
Keywords=notes;markdown;editor;
MimeType=text/markdown;
StartupWMClass=scratch-notes
StartupNotify=true
EOF
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
