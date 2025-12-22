# Maintainer: Danny McClelland <danny@dmcc.io>
pkgname=archnote
pkgver=0.1.0
pkgrel=1
pkgdesc="A beautiful, minimal scratchpad note-taking app for Arch Linux with Omarchy theme support"
arch=('x86_64')
url="https://github.com/dannymcc/Archnote"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'git')
source=("$pkgname-$pkgver::git+https://github.com/dannymcc/Archnote.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install
    npm run tauri build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 "src-tauri/target/release/archnote" "$pkgdir/usr/bin/archnote"
    
    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/archnote.desktop" << END
[Desktop Entry]
Name=Archnote
Comment=A beautiful scratchpad note-taking app
Exec=archnote
Icon=archnote
Terminal=false
Type=Application
Categories=Utility;TextEditor;
Keywords=notes;scratchpad;text;
END
    
    # Install icon
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/archnote.png"
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/archnote.png"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
