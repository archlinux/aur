# Maintainer: Nelson Duarte <nelsonduarte@github.com>
pkgname=pdfapps
pkgver=1.9.0
pkgrel=1
pkgdesc="Fast, offline, subscription-free PDF editor with 13 built-in tools"
arch=('any')
url="https://nelsonduarte.github.io/PDFApps/"
license=('MIT')
depends=(
    'python>=3.10'
    'pyside6'
    'python-pypdf'
    'python-pymupdf'
    'python-pillow'
    'python-pytesseract'
    'python-docx'
    'python-qtawesome'
    'hicolor-icon-theme'
)
optdepends=(
    'tesseract: OCR text recognition'
    'tesseract-data-eng: English OCR'
    'tesseract-data-por: Portuguese OCR'
    'tesseract-data-spa: Spanish OCR'
    'tesseract-data-fra: French OCR'
    'tesseract-data-deu: German OCR'
    'ghostscript: advanced PDF compression'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nelsonduarte/PDFApps/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23a6b21beb99337632131f14f549a5c2c397e86d44ef004bb6da538c41e2905a')

package() {
    cd "$srcdir/PDFApps-$pkgver"

    # App package
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r app pdfapps.py icon.ico icon_512.png pdfapps.svg \
        "$pkgdir/usr/share/$pkgname/"

    # Launcher script
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
cd /usr/share/pdfapps
exec python3 pdfapps.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Desktop file
    install -Dm644 flatpak/io.github.nelsonduarte.PDFApps.desktop \
        "$pkgdir/usr/share/applications/io.github.nelsonduarte.PDFApps.desktop"

    # AppStream metainfo
    install -Dm644 flatpak/io.github.nelsonduarte.PDFApps.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.nelsonduarte.PDFApps.metainfo.xml"

    # Icons
    install -Dm644 icon_512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.nelsonduarte.PDFApps.png"
    install -Dm644 pdfapps.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.nelsonduarte.PDFApps.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
