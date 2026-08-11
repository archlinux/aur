# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=playwright-mcp
pkgver=0.0.79
pkgrel=1
pkgdesc="MCP server that provides browser automation capabilities using Playwright"
arch=('any')
url="https://github.com/microsoft/playwright-mcp"
license=('Apache-2.0')
depends=('nodejs>=18')
makedepends=('npm')
optdepends=(
    'chromium: use system Chromium instead of Playwright-managed browsers'
    'firefox: use system Firefox instead of Playwright-managed browsers'
)
_npmname="@playwright/mcp"
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/${_npmname}/-/mcp-${pkgver}.tgz")
sha256sums=('c35077b88e070b57b15db0040991289eeaf19bccbd397a41898f28654a1d33ee')
noextract=("$pkgname-$pkgver.tgz")

latestver() {
    curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" |
        python3 -c "import sys,json; print(json.load(sys.stdin)['version'])"
}

package() {
    npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" \
        --omit=dev --ignore-scripts "$srcdir/$pkgname-$pkgver.tgz"

    # Remove non-Linux platform scripts
    find "$pkgdir" -type f \( -name "*.ps1" -o -name "*_mac.*" -o -name "*_wsl.*" \) -delete

    # Fix npm reference paths
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"
    find "$pkgdir" -name package.json -exec sed -i "s|$srcdir||g;s|$pkgdir||g" {} +

    chown -R root:root "$pkgdir"
}
