# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=HTMLHint
pkgname=htmlhint
pkgver=0.14.2
pkgrel=2
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('git' 'jq' 'npm')
source=("git+https://github.com/htmlhint/HTMLHint.git#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd $_name
  npm ci
  npm run build
  npm pack
}

check() {
  cd $_name
  npm test
}

package() {
  cd $_name
  npm install --global \
              --user root \
              --prefix "$pkgdir"/usr \
              --production \
              $pkgname-$pkgver.tgz
  chown -R root:root "$pkgdir"
  cp -r dist "$pkgdir"/usr/lib/node_modules/$pkgname
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/lib/node_modules/$pkgname/LICENSE.md \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md

  # Remove references to $srcdir and $pkgdir
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

# vim:set ts=2 sw=2 et:
