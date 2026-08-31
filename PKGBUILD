# Maintainer: Tanay Pant <tanaypant@protonmail.com>
pkgname=tokyo-notes-git
pkgver=r226.g1c298bd
pkgrel=1
pkgdesc="A minimal GTK4 Markdown note-taking app"
arch=('any')
url="https://github.com/tanay1337/tokyo-notes"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'cairo' 'python-cairo' 'python-cryptography' 'python-gitpython' 'python-pyspellchecker' 'portaudio')
makedepends=('git')
provides=('tokyo-notes')
conflicts=('tokyo-notes')
source=("$pkgname::git+https://github.com/tanay1337/tokyo-notes.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    # Install main application files
    install -dm755 "$pkgdir/usr/share/tokyo-notes"
    cp -r assets themes core ui markdown translations main.py style.css "$pkgdir/usr/share/tokyo-notes/"

    # Install launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/tokyo-notes" << 'EOF'
#!/bin/sh
exec python3 /usr/share/tokyo-notes/main.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/tokyo-notes"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install .desktop file
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/tokyo-notes.desktop" << 'EOF'
[Desktop Entry]
Name=Tokyo Notes
Comment=A minimal GTK4 Markdown note-taking app
Exec=tokyo-notes
Icon=/usr/share/tokyo-notes/assets/tokyo_notes_icon.svg
Terminal=false
Type=Application
Categories=Office;TextEditor;Utility;
Keywords=notes;markdown;editor;tasks;
StartupWMClass=tokyo-notes
EOF
}
