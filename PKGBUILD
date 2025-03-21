pkgname=basedpyright
pkgver=1.28.3
pkgrel=1
pkgdesc="pyright fork with various improvements and pylance features"
arch=("any")
url=https://docs.basedpyright.com/
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "git"
    # Parsing stub files
    "tk")
checkdepends=("python-pytest")
source=("$pkgname-$pkgver.tar.gz::https://github.com/DetachHead/basedpyright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c5ea110822b29d53fc748ed1c2f35f99c7c1718808b0fed726c5a2b965f8fc1')

prepare() {
    cd "$pkgname-$pkgver"
    # See /build/generateAllDocstubs.sh
    ./pw uv sync --only-group=docstubs --no-install-project
    ./pw uv run --no-sync build/py3_8/generate_docstubs.py

    npm install
    cd packages/pyright
    npm install
    cd ../pyright-internal
    npm install
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
    cp -r docs "$pkgdir/usr/share/doc/$pkgname"
    
    cd packages/pyright
    cp -r dist {,langserver.}index.js package.json "$target"
}
