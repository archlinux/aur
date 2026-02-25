# Maintainer: Erkan ÖZ <https://lifeos.com.tr>
pkgname=lifeos-deb2arch
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert Debian .deb packages to native Arch Linux .pkg.tar.zst format"
arch=('any')
url="https://lifeos.com.tr"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'binutils' 'tar' 'zstd' 'fakeroot')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://lifeos.com.tr/download/app-downloads/1772013643995-lifeos-deb2arch-1.0.0.tar.gz")
sha256sums=('70ea590a9e88f2e28774e49703f5575a72cd3e450823f0be749882db4547140a')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install application files
    install -dm755 "$pkgdir/opt/$pkgname"
    install -Dm755 main.py "$pkgdir/opt/$pkgname/main.py"
    install -Dm755 converter.py "$pkgdir/opt/$pkgname/converter.py"
    install -Dm644 deps_translation.json "$pkgdir/opt/$pkgname/deps_translation.json"
    install -Dm644 icon.png "$pkgdir/opt/$pkgname/icon.png"

    # Install desktop entry
    install -Dm644 lifeos-deb2arch.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icon for desktop environments (multiple sizes + pixmaps fallback)
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create launcher script in PATH
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec python /opt/lifeos-deb2arch/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
