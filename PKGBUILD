# Maintainer: Yaroslav Krytsun <slavko7 at gmail dot com>
pkgname=monokular
pkgver=1.1.0
pkgrel=2
pkgdesc="Export PDF pages as images with preview - one thing, done well"
arch=('any')
url="https://github.com/dyedfox/monokular"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyqt6'
    'python-pymupdf'
)
makedepends=('git' 'qt6-tools')
optdepends=('qt6-imageformats: WEBP and TIFF export')
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    for ts in translations/*.ts; do
        lrelease6 "$ts"
    done
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install app files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r app/ main.py "$pkgdir/usr/lib/$pkgname/"

    # Install compiled translations
    install -dm755 "$pkgdir/usr/lib/$pkgname/translations"
    for qm in translations/*.qm; do
        [ -f "$qm" ] && install -m644 "$qm" "$pkgdir/usr/lib/$pkgname/translations/"
    done

    # Install icon
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    # Install desktop file
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec python3 /usr/lib/monokular/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
