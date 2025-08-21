pkgname=basedpyright
pkgver=1.31.3
pkgrel=1
pkgdesc="pyright fork with various improvements and pylance features"
arch=("any")
url=https://docs.basedpyright.com/
license=("MIT")
depends=("nodejs")
makedepends=(npm
             # generateAllDocstubs
             python
             tk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DetachHead/basedpyright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6397befe6feee8150a3b4063f08443cab49ddd7b12d1dceddbf211ec406b204f')

prepare() {
    cd "$pkgname-$pkgver"
    # ./build/generateAllDocstubs.sh
    ./pw uv sync --only-group=docstubs --no-install-project
    ./pw uv run --no-sync build/py3_8/generate_docstubs.py
    npm ci
}

build() {
    cd "$pkgname-$pkgver/packages/pyright"
    npm run build
}

package() {
    cd "$pkgname-$pkgver"
    local target="$pkgdir/usr/lib/node_modules/$pkgname"
    mkdir -p "$pkgdir/usr/bin" "$target"
    ln -s ../lib/node_modules/$pkgname/index.js "$pkgdir/usr/bin/$pkgname"
    ln -s ../lib/node_modules/$pkgname/langserver.index.js "$pkgdir/usr/bin/$pkgname-langserver"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    
    cd packages/pyright
    cp -r dist {,langserver.}index.js package.json "$target"
}
