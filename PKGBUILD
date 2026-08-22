# Maintainer: Nan Wu (enihcam)

pkgname=lininn-openflow
_pkgname=@lininn/openflow
_commit=88b23bd331955e056ab2088953d27421306e5ebc
pkgver=0.5.0
pkgrel=2
pkgdesc="OpenSpec + Superpowers workflow orchestrator for agentic development"
arch=('any')
url="https://github.com/lininn/openflow"
license=('MIT')
depends=('nodejs>=18.0.0')
optdepends=('openspec: enable OpenSpec CLI integration')
makedepends=('npm')
source=(
    "$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/openflow-$pkgver.tgz"
    "$pkgname-$pkgver-package-lock.json::https://raw.githubusercontent.com/lininn/openflow/$_commit/package-lock.json"
)
sha256sums=(
    'a3032793d5f43d5da2fae58d178b9a68c51b3a0cdc81b0c2a07d200f1532b597'
    '4fc1e4f7e0ef45a0f64ed02029d3fce1f16184f718fd8479ca9bbd1b9b0962a7'
)

prepare() {
    cp "$srcdir/$pkgname-$pkgver-package-lock.json" "$srcdir/package/package-lock.json"
}

build() {
    cd "$srcdir/package"

    npm ci --omit=dev --ignore-scripts --no-fund --no-audit \
        --cache "$srcdir/npm-cache"
}

check() {
    cd "$srcdir/package"

    node bin/openflow.js --help >/dev/null
}

package() {
    cd "$srcdir/package"

    # Install to global node_modules location
    install -d "$pkgdir/usr/lib/node_modules/@lininn"
    cp -r "$srcdir/package/" "$pkgdir/usr/lib/node_modules/@lininn/openflow"
    rm -f "$pkgdir/usr/lib/node_modules/@lininn/openflow/package-lock.json" \
        "$pkgdir/usr/lib/node_modules/@lininn/openflow/node_modules/.package-lock.json"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create bin symlink
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/node_modules/@lininn/openflow/bin/openflow.js" "$pkgdir/usr/bin/openflow"
}
