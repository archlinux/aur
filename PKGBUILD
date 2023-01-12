# Maintainer: Florian Maunier <fmaunier@kuzzle.io>
pkgname=kourou
pkgver=0.25.0
pkgrel=1
pkgdesc="The CLI that helps you manage your Kuzzle application"
arch=('any')
url="https://github.com/kuzzleio/kourou"
license=('Apache')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('ffd8b17a139140873d37406e8c3d2e8052d1a06642dbd2061f564ed84955c7bac1e6156da410491ae644c83e1de39e52cc5553244090ca93a59818ee59999793')

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # Shell completions
  cd "$pkgdir/usr/bin"
  XDG_CACHE_HOME="$srcdir/cache" ./kourou autocomplete:create
  install -Dm644 "$srcdir/cache/kourou/autocomplete/functions/zsh/_kourou" \
    "$pkgdir/usr/share/zsh/site-functions/_kourou"
  install -Dm644 "$srcdir/cache/kourou/autocomplete/functions/bash/kourou.bash" \
    "$pkgdir/usr/share/bash-completion/completions/kourou"

  # Remove references to $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # Remove references to $srcdir
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

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
