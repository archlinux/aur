# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=ccusage
pkgver=15.2.0
pkgrel=1
pkgdesc="A CLI tool for analyzing Claude Code token usage and costs from local JSONL files"
arch=('any')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryoppippi/ccusage/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install --ignore-scripts
    npm run build || true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install to /usr/lib/node_modules
    install -dm755 "$pkgdir/usr/lib/node_modules/$pkgname"
    cp -r dist package.json "$pkgdir/usr/lib/node_modules/$pkgname/"
    
    # Create symlink for binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/usr/lib/node_modules/$pkgname/dist/index.js" "$pkgdir/usr/bin/$pkgname"
    
    # Make binary executable
    chmod +x "$pkgdir/usr/lib/node_modules/$pkgname/dist/index.js"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}