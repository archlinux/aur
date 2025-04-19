pkgname=basedpyright
pkgver=1.29.0
pkgrel=1
pkgdesc="pyright fork with various improvements and pylance features"
arch=("any")
url=https://docs.basedpyright.com/
license=("MIT")
depends=("nodejs")
makedepends=(
    npm
    # generateAllDocstubs
    python
    tk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DetachHead/basedpyright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1af1260687c0edb36d17bb0767cbfc16fdd7aca4c5d452fd3aa2a49a74a70abc')

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

#check() {
#    cd "$pkgname-$pkgver/packages/pyright-internal"
#    npm test
#}

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
