pkgname=basedpyright
pkgver=1.13.3
pkgrel=1
pkgdesc="pyright fork with various improvements and pylance features"
arch=("any")
url=https://docs.basedpyright.com/
license=("MIT")
depends=("nodejs")
makedepends=("npm" "python" "git"
    # Parsing stub files
    "tk")
source=("$pkgname-$pkgver.tar.gz::https://github.com/DetachHead/basedpyright/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1768d21eb57bb7fd4db885643551d2a23fbca27d319b04392ce59725c8471ad')

prepare() {
    cd "$pkgname-$pkgver"
    # See /based_build/generateAllDocstubs.sh
    ./pw pdm install --group=docstubs --no-self --no-default
    ./pw pdm run generate_docstubs

    npm install
}

build() {
    cd "$pkgname-$pkgver"
    npm run build:cli:dev
}

check() {
    cd "$pkgname-$pkgver/packages/pyright-internal"
    npm test
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
