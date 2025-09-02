# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=16.2.2
pkgrel=2
pkgdesc="A CLI tool for analyzing Claude Code token usage and costs from local JSONL files"
arch=('any')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
depends=('nodejs')
makedepends=('bun-bin' 'curl' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryoppippi/ccusage/archive/v$pkgver.tar.gz")
sha256sums=('04bde632608baf117fdc1d31d40089e489855da322941aaf4c27eaa9d12609b0')

pkgver() {
    curl -s "https://api.github.com/repos/ryoppippi/ccusage/releases/latest" | 
    jq -r '.tag_name' | sed 's/^v//'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    bun install --ignore-scripts
    bun run build
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
