# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmm
pkgver=1.0.3
pkgrel=1
pkgdesc="Markdown Mixed Media - A powerful terminal markdown viewer with image support, Mermaid diagrams, and PDF/ODT export"
arch=('any')
url="https://github.com/aaronsb/markdown-mixed-media"
license=('MIT')
depends=('nodejs>=20')
optdepends=(
    'chafa: Terminal image rendering support'
    'mermaid-cli: Mermaid diagram rendering'
    'chromium: PDF generation support'
)
makedepends=('npm' 'git')
options=('!strip')  # Don't strip binaries to avoid fakeroot issues
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/markdown-mixed-media/archive/v$pkgver.tar.gz")
sha256sums=('1bbf62837b53295257d8deb8d5dcca602bfa0e6372a094fe413866d8007e7bc7')

build() {
    cd "$srcdir/markdown-mixed-media-$pkgver"

    # Install dependencies
    npm install --production=false

    # Build the project
    npm run build

    # Create the executable
    npm run build:simple
}

package() {
    cd "$srcdir/markdown-mixed-media-$pkgver"

    # Create directories
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"

    # Copy built files
    cp -r dist "$pkgdir/usr/lib/$pkgname/"
    cp package.json "$pkgdir/usr/lib/$pkgname/"

    # Copy node_modules but exclude problematic binaries
    cp -r node_modules "$pkgdir/usr/lib/$pkgname/"

    # Remove problematic binary files that cause fakeroot issues
    find "$pkgdir/usr/lib/$pkgname/node_modules" -type f -name "*.node" -delete 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname/node_modules" -type f -name "*.so" -delete 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname/node_modules" -type f -name "*.dylib" -delete 2>/dev/null || true

    # Remove puppeteer's chromium download to save space (PDF generation will need system chromium)
    rm -rf "$pkgdir/usr/lib/$pkgname/node_modules/puppeteer/.local-chromium" 2>/dev/null || true
    rm -rf "$pkgdir/usr/lib/$pkgname/node_modules/puppeteer-core/.local-chromium" 2>/dev/null || true

    # Create wrapper script
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/usr/bin/env node
import '/usr/lib/$pkgname/dist/index-direct.js';
EOF

    # Make executable
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}