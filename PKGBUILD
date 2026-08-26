# Maintainer: Gyula Kisrákói <krakoi90@gmail.com>
_npmname=betterwright
pkgname=betterwright-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Policy-guarded, token-efficient Playwright browser for AI agents"
arch=('any')
url="https://github.com/BetterWright/betterwright"
license=('MIT')
depends=('nodejs>=22.18.0')
makedepends=('npm')
provides=('betterwright')
conflicts=('betterwright')
install=betterwright.install
noextract=("$_npmname-$pkgver.tgz")
source=("$_npmname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('4db6fa2d55d64b4982145b5477a42d2b8b85a5434639481d0740db597c1b23c1')

package() {
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export npm_config_cache="$srcdir/npm-cache"


  npm install \
    --global \
    --prefix "$pkgdir/usr" \
    --no-audit \
    --no-fund \
    "$srcdir/$_npmname-$pkgver.tgz"

  # Clean non-deterministic npm build paths
  find "$pkgdir" -name package.json -exec sed -i '/_where/d' {} +

  # Install license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fix root permissions
  chown -R root:root "$pkgdir"
}
