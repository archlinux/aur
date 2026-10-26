# Maintainer: Hannes Spitz <h.spitz@outlook.de>
# Fixed-release package built from the GitHub release tarball.
# For the latest master HEAD instead, use sidemark-git (PKGBUILD in the repo root).
# pkgver + sha256sums are updated by publish.sh on every release.
pkgname=sidemark
pkgver=0.7.0
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
    # the PDF export embeds it so notes keep their maths — the
    # built-in PDF fonts are Latin-1 and turn α ∑ ℝ → into '?'
    'ttf-dejavu'
)
optdepends=(
    'librsvg: render PNG icon sizes at install time'
    'libreoffice: convert PPTX files to PDF'
    'ocrmypdf: add a searchable text layer to scanned PDFs (OCR)'
    'qrencode: show a QR code to share the PDF to a phone'
    'jq: recent-files menu for the walker launcher'
)
conflicts=('sidemark-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d918d00768beb04a592e63845a0b74dc5b87ffa9052c5d5d92ad4d0fb0130b4a')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Main script
    install -Dm755 sidemark.py \
        "$pkgdir/usr/share/sidemark/sidemark.py"

    # What this copy IS, for `sidemark --version`. A package has no .git once
    # installed, and a user with both an AUR package and install.sh's copy can
    # only tell which one PATH picked if each says so.
    # No commit here, and that is correct rather than a gap: this package is
    # built from a RELEASE TARBALL, which carries no git history, and the
    # version tag is the identity anyway — `by` below records it. (The
    # sidemark-git PKGBUILD in the repo root does have a clone, and records
    # the commit.)
    install -dm755 "$pkgdir/usr/share/sidemark"
    cat > "$pkgdir/usr/share/sidemark/build.json" <<JSON
{
  "commit": null,
  "dirty": 0,
  "built": "$(date '+%Y-%m-%d %H:%M')",
  "by": "$pkgname $pkgver-$pkgrel"
}
JSON
    chmod 644 "$pkgdir/usr/share/sidemark/build.json"

    # The browser port, served to a phone by Share to phone — the QR lands on
    # it, so without it a share falls back to the small image viewer that
    # cannot zoom. test/ and package.json are development-only.
    if [ -d web ]; then
        install -dm755 "$pkgdir/usr/share/sidemark/web"
        cp -r web/. "$pkgdir/usr/share/sidemark/web/"
        rm -rf "$pkgdir/usr/share/sidemark/web/test" \
               "$pkgdir/usr/share/sidemark/web/node_modules" \
               "$pkgdir/usr/share/sidemark/web/dist" \
               "$pkgdir/usr/share/sidemark/web/package.json" \
               "$pkgdir/usr/share/sidemark/web/package-lock.json"
        find "$pkgdir/usr/share/sidemark/web" -type f -exec chmod 644 {} +
        find "$pkgdir/usr/share/sidemark/web" -type d -exec chmod 755 {} +
    fi

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

    # Bash completion for the 'sidemark' command
    install -Dm644 extras/sidemark.bash \
        "$pkgdir/usr/share/bash-completion/completions/sidemark"

    # Walker/elephant menu (copy to ~/.config/elephant/menus/ to enable)
    install -Dm644 extras/sidemark_recent.lua \
        "$pkgdir/usr/share/sidemark/extras/sidemark_recent.lua"

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
