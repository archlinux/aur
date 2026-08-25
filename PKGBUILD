# Maintainer: Nan Wu (enihcam)

pkgname=lininn-openflow
_pkgname=@lininn/openflow
_commit=3085c4b0c06aa9915862b8f7a0767651c0a5e0af
pkgver=0.5.1
pkgrel=1
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
    'd9a5aee3e166a507143efc0493357e71da5912307953140cfc944593ad36c562'
    '62560b26af11af9cfb55f148db995727f068843efa185440173194f418a13c19'
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
