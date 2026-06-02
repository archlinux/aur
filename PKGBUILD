# Maintainer: Hannes Spitz <h.spitz@outlook.de>
pkgname=sidemark-git
pkgver=r61.02f4ca4
pkgrel=1
pkgdesc="PDF viewer and annotator with a live markdown notes sidebar"
arch=('any')
url="https://github.com/brokkoli71/sidemark"
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
    'adwaita-icon-theme'
)
optdepends=(
    'librsvg: render PNG icon sizes at install time'
    'libreoffice: convert PPTX files to PDF'
)
source=("sidemark::git+https://github.com/brokkoli71/sidemark.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/sidemark"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/sidemark"

    # Main script
    install -Dm755 sidemark.py \
        "$pkgdir/usr/share/sidemark/sidemark.py"

    # Wrapper in PATH
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/sidemark" <<'EOF'
#!/bin/sh
exec /usr/bin/python3 /usr/share/sidemark/sidemark.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/sidemark"

    # Desktop entry
    install -Dm644 de.hspitz.sidemark.desktop \
        "$pkgdir/usr/share/applications/de.hspitz.sidemark.desktop"

    # SVG icon (always)
    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/de.hspitz.sidemark.svg"

    # PNG icons (if librsvg is present on the build machine)
    if command -v rsvg-convert >/dev/null 2>&1; then
        for size in 16 32 48 64 128 256; do
            install -dm755 \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
            rsvg-convert icon.svg -w "$size" -h "$size" \
                -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/de.hspitz.sidemark.png"
        done
    fi
}
