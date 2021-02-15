# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-standard
pkgver=20.0.0
pkgrel=4
pkgdesc='Standard shareable config for stylelint'
arch=('any')
url=https://github.com/stylelint/stylelint-config-standard
license=('MIT')
depends=('stylelint')
makedepends=('git' 'jq' 'npm')
source=("git+$url.git")
b2sums=('SKIP')

build() {
  cd $pkgname
  npm ci
  npm pack
}

check() {
  cd $pkgname
  npm test
}

package() {
  cd $pkgname
  npm install --global \
              --user root \
              --prefix "$pkgdir"/usr \
              --production \
              $pkgname-$pkgver.tgz
  chown -R root:root "$pkgdir"

  # Remove references to $srcdir and $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}

# vim:set ts=2 sw=2 et:
