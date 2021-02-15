# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=13.10.0
pkgrel=2
pkgdesc='Mighty, modern CSS linter'
arch=('any')
url=https://stylelint.io
license=('MIT')
depends=('nodejs')
makedepends=('git' 'jq' 'npm')
optdepends=('stylelint-config-standard: for the standard shareable config')
source=("git+https://github.com/stylelint/stylelint.git#tag=$pkgver")
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
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/lib/node_modules/$pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Remove references to $srcdir and $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}

# vim:set ts=2 sw=2 et:
