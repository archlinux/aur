# Maintainer: Gyula Kisrákói <krakoi90@gmail.com>
_npmname=betterwright
pkgname=betterwright-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Policy-guarded, token-efficient Playwright browser for AI agents"
arch=('any')
options=('!debug')
url="https://github.com/BetterWright/betterwright"
license=('MIT')
depends=('nodejs>=22.18.0')
makedepends=('npm')
provides=('betterwright')
conflicts=('betterwright')
install=betterwright.install
noextract=("$_npmname-$pkgver.tgz")
source=("$_npmname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('e1a2509a359bbee298b30f7e3ab4af484e67b2fc8a35650a0d1b86576393e29e')

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
