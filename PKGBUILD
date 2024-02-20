# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.7.0
pkgrel=2
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
sha512sums=('d908a45e79a99c57b6b37dd0f13798139fac5f2287519fbd97959f0e6a6eba91dd72de87fc6e9beb3dc70a3fb6ae531128a6391252efe57b4ba3139c69f9cbd2')
b2sums=('9b2c32af7c0317c931950d9b6b060ecb349afbdc486a8220a8fcb9ed43ad290ff93dc9a0b24925f6771b268ef3143b15e0e502d169818310ace337d0ef27ec51')

package() {
  npm install \
    --global \
    --cache "${srcdir}/npm-cache" \
    --prefix "$pkgdir/usr" \
    --no-audit --no-fund --no-update-notifier \
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
