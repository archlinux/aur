# Maintainer: Nan Wu (enihcam)

pkgname=lininn-openflow
_pkgname=@lininn/openflow
_commit=db5ef31085680287f1ab478a5eab995dcca25d51
pkgver=0.5.2
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
    '2eb5fd1d48728166f7946eb0227857b2a8d3a3d4ea15a58dce188d729473b225'
    '28d70faf59669019f25b900269e3107e89e9df30b94182d6123eaa94991bf4be'
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
