# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kyle Laker <kyle+aur at laker dot email>
pkgname=marp-cli
pkgver=3.4.0
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit based converters"
url="https://github.com/marp-team/${pkgname}"
arch=(x86_64)
license=(MIT)
makedepends=(npm jq)
optdepends=('chromium: PDF/PPTX/image conversion'
  'google-chrome: PDF/PPTX/image conversion')
depends=(nodejs)
conflicts=(marp-cli-bin)
replaces=(marp)
options=('!strip')
source=(https://registry.npmjs.org/@marp-team/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('2274f06d9a647a590aec9327e0117dd6dd6ced3fa217d72f054ed76d96d79ae07521ed142ae268bd9502bfdcb6073707e36f997581296b643e0f7ab776666e68')
# I may need to extract it for installing license.
#noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/${pkgname}-${pkgver}.tgz"
  #    chmod -R go-w "$pkgdir/usr"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  # local tmppackage
  local pkgjson="$pkgdir/usr/lib/node_modules/@marp-team/${pkgname}/package.json"
  # local pkgjson

  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  # Install MIT license
  install -Dm644 "$srcdir/package/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
