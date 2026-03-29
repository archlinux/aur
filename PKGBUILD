# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=sillytavern
_pkgname=SillyTavern
pkgver=1.17.0
pkgrel=1
pkgdesc="Locally installed user interface for LLMs, image generation, and TTS voice models"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SillyTavern/$_pkgname"
license=('AGPL-3.0-only')
depends=('nodejs')
makedepends=('npm' 'jq')
conflicts=('sillytavern-git')
options=('!strip' '!debug')
backup=('usr/share/sillytavern/config.yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ff041b119b929923b0955d35bdeed3d9ed434dcfbc2b8224975a1fe36fc483e5')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	export NODE_ENV=production
	npm i --no-save --no-audit --no-fund --loglevel=error --no-progress --omit=dev --ignore-scripts
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	export NODE_ENV=production
	npm rebuild
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -r . "$pkgdir/usr/share/$pkgname"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/share/$pkgname/package.json"

	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" > "$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<-EOF
		#!/bin/sh
		mkdir -p "\$HOME/.local/share/$pkgname"
		cd /usr/share/$pkgname && exec node /usr/share/$pkgname/server.js --dataRoot "\$HOME/.local/share/$pkgname" "\$@"
	EOF
}
