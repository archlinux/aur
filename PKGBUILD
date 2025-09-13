# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=16.2.4
pkgrel=1
pkgdesc="A CLI tool for analyzing Claude Code token usage and costs from local JSONL files"
arch=('any')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
depends=('nodejs')
makedepends=('bun-bin' 'curl' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ryoppippi/ccusage/archive/v$pkgver.tar.gz")
sha256sums=('fc56e3d3130ff9b362f2bb1dc5991f3f8ef929e8927a19bf98844b53aba8460b')

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
