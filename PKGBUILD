# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Maintainer: Bret Comnes <bcomnes@gmail.com>

pkgname=homebridge
pkgver=2.0.2
pkgrel=1
pkgdesc='HomeKit support for the impatient'
arch=('any')
url='https://github.com/homebridge/homebridge'
license=('Apache')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=('homebridge-config-ui-x: for web-based management tool')
options=('!emptydirs' '!strip')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('e2d9fc7c93be3a152c90eb71b7c6f62e88e36f239ec4cbab5d7c7b8a772210e8c6db8984c8aae970391c36a77283cc694afb9a6b7678835fb500d8f09703621e')
b2sums=('0297e21780fac51174ea552bf3dcc88c2da6b7491e0a063143c90a13eb8ec6886065a780df63a9f48d9288b7d20df25b041c148a296fa85fd24623fca7326e45')

package() {
  npm install \
    --global \
    --cache "${srcdir}/npm-cache" \
    --prefix "$pkgdir/usr" \
    --no-audit --no-fund --no-update-notifier --ignore-scripts \
    "$srcdir/$pkgname-$pkgver.tgz"

    # Clean up srcdir references
    # https://wiki.archlinux.org/title/Node.js_package_guidelines#Package_contains_reference_to_$srcdir/$pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    find "$pkgdir" -type f -name package.json | while read pkgjson; do
      local tmppackage="$(mktemp)"
      jq 'del(.man)' "$pkgjson" > "$tmppackage"
      mv "$tmppackage" "$pkgjson"
      chmod 644 "$pkgjson"
    done
}
