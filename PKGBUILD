pkgname=basedpyright
pkgver=1.28.0
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
sha256sums=('02d7179cf19c3db9aa9db265f165d01258f30d160587d6c1ea51e70a471cc764')

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
