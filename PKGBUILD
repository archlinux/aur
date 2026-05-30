# Maintainer: Hannes Spitz <h.spitz@outlook.de>
pkgname=pdf-editor-omarchy-git
pkgver=r1.0
pkgrel=1
pkgdesc="PDF annotation and note-taking app with live markdown sidebar, designed for Omarchy"
arch=('any')
url="https://github.com/brokkoli71/pdf-editor-omarchy"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-pymupdf'
    'python-numpy'
    'python-cairo'
    'gtksourceview5'
)
optdepends=(
    'librsvg: render PNG icon sizes at install time'
    'libreoffice: convert PPTX files to PDF'
)
source=("pdf-editor-omarchy::git+https://github.com/brokkoli71/pdf-editor-omarchy.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/pdf-editor-omarchy"

    # Main script
    install -Dm755 pdfeditor.py \
        "$pkgdir/usr/share/pdf-editor-omarchy/pdfeditor.py"

    # Wrapper in PATH
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pdfeditor" <<'EOF'
#!/bin/sh
exec /usr/bin/python3 /usr/share/pdf-editor-omarchy/pdfeditor.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/pdfeditor"

    # Desktop entry
    install -Dm644 de.hspitz.pdfeditor.desktop \
        "$pkgdir/usr/share/applications/de.hspitz.pdfeditor.desktop"

    # SVG icon (always)
    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/de.hspitz.pdfeditor.svg"

    # PNG icons (if librsvg is present on the build machine)
    if command -v rsvg-convert >/dev/null 2>&1; then
        for size in 16 32 48 64 128 256; do
            install -dm755 \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
            rsvg-convert icon.svg -w "$size" -h "$size" \
                -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/de.hspitz.pdfeditor.png"
        done
    fi
}
