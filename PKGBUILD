# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=revolut-x-cli
pkgver=1.0.52
pkgrel=1
pkgdesc="Command-line interface for Revolut X crypto exchange trading"
arch=('any')
url="https://github.com/revolut-engineering/revolut-x-api"
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm')
_npmname='@revolut/revolut-x-cli'
source=(
  "$pkgname-$pkgver.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname#*/}-${pkgver}.tgz"
  "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/revolut-engineering/revolut-x-api/v${pkgver}/LICENSE"
)
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f173b222c7c09d50053aa20cdc65bc18861285a3095b66cec509d824bf370b18'
            '72380798af61d6131287b0dd3c8dc5345535df641002fece3a02d7ef109c5f8e')

latestver() {
  curl -fsSL 'https://api.github.com/repos/revolut-engineering/revolut-x-api/releases/latest' |
    sed -nE 's/^[[:space:]]*"tag_name":[[:space:]]*"v?([^"]+)".*/\1/p'
}

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" \
    --omit=dev --ignore-scripts "$srcdir/$pkgname-$pkgver.tgz"

  find "$pkgdir" -type f -name package.json -print0 |
    xargs -0 -r sed -i "/_where/d;s|$srcdir||g;s|$pkgdir||g"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "$pkgdir"
}
