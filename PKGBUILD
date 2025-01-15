pkgname=basedpyright
pkgver=1.24.0
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
sha256sums=('945370db3c26488e7e63676467660beada5c9d8ef3cc660f7524cf58305505bb')

prepare() {
    cd "$pkgname-$pkgver"
    # See /build/generateAllDocstubs.sh
    ./pw uv sync --only-group=docstubs --no-install-project
    ./pw uv run --no-sync build/generate_docstubs.py

    ./pw uv sync --config-setting regenerate_docstubs=false

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

check() {
    cd "$pkgname-$pkgver"
    ./pw uv run npm run test-python -- -m needs_all_docstubs
    cd packages/pyright-internal
    mkdir -p node_modules/.bin
    ln -srfv node_modules/webpack/bin/webpack.js node_modules/.bin/webpack
    ln -srfv node_modules/webpack-cli/bin/cli.js node_modules/.bin/webpack-cli
    ln -srfv node_modules/jest/bin/jest.js node_modules/.bin/jest
    npm test -- --testTimeout=100000 --maxWorkers=1
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
