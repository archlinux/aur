# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmm
pkgver=1.0.0
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/markdown-mixed-media/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
    cp -r node_modules "$pkgdir/usr/lib/$pkgname/"
    cp package.json "$pkgdir/usr/lib/$pkgname/"

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