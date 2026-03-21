# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kyle Laker <kyle+aur at laker dot email>
pkgname=marp-cli
pkgver=4.3.1
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
b2sums=('ce06d905291a9d4b9bfd79f2acd526efdaaa57c75d6ffb538434673013a8e0bda64da72acb0844d5012b53ee2e68fe78364346faaf3f9ac5bf9b9849b1335bd1')
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
