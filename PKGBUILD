# Maintainer: Chris Icenhour <chris@randomlinux.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=coinmon
pkgver=0.0.24
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/coinmon/-/coinmon-$pkgver.tgz" "fix_index_js.patch")
noextract=("${source[@]##*/}")
sha512sums=('a5bff3925c24c99addc50075ce6ea7e3a87e36b1cf5be2f41fc43d8a4a7cbf7d4010b81a66553b73fd00af017ab0009d3039aeadf18fda538ab04367bfbc4dde'
            '1a6baffb1a0103adb5dd3aea35078b8fbaa40400a3fd44c99d6cf15da9c8f49a1851ff86365e317731074aaef30989b1cd8f03c4235076324de1f43a316b0047')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tgz

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/usr/lib/node_modules/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/

  chown -R root:root "$pkgdir/usr/"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove unneeded files
  find $pkgdir/usr/lib/node_modules/coinmon -maxdepth 1 -type f -not -name package.json -delete

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  chmod 755 $pkgdir/usr/bin
  find $pkgdir/usr/lib/node_modules -type d -exec chmod 755 {} +
  patch -p1 -d "$pkgdir/usr/lib/node_modules/$pkgname/" < $srcdir/fix_index_js.patch
}
