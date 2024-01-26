# Maintainer: Florian Maunier <fmaunier@kuzzle.io>
pkgname=kourou
pkgver=0.28.1
pkgrel=1
pkgdesc="The CLI that helps you manage your Kuzzle application"
arch=('any')
url="https://github.com/kuzzleio/kourou"
license=('Apache')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('6a9223036b66f7d75ea76c6bf4bcd76ec89798f699795a31fe9ce9c1c71e9df3887eb4cabee24d70d880d19af0efd7ca6218097361f9c21233bfcef8d831709b')

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
