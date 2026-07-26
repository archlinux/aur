# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=toon-cli
pkgver=4.1.0
pkgrel=1
pkgdesc="Convert JSON to/from TOON (Token-Oriented Object Notation), with token-savings analysis"
arch=('any')
url="https://toonformat.dev"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@toon-format/cli/-/cli-$pkgver.tgz")
sha256sums=('37c196454fcbf2eae26da5eb8ff11bd2f3e73ce7c01d8fd11008b5df07316fdb')
noextract=("$pkgname-$pkgver.tgz")

latestver() {
    curl -fsSL 'https://registry.npmjs.org/@toon-format/cli/latest' | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"
}

package() {
    npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" \
        --omit=dev --ignore-scripts "$srcdir/$pkgname-$pkgver.tgz"

    # Clean npm artifacts
    find "$pkgdir/usr" -type d -name .cache -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"
    chown -R root:root "$pkgdir"

    install -Dm644 "$pkgdir/usr/lib/node_modules/@toon-format/cli/LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
