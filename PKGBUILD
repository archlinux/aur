# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Reference: sillytavern-git by Seth Hoong <hoong seth at gmail dot com>

pkgname=sillytavern
_pkgname=SillyTavern
pkgver=1.16.0
pkgrel=2
pkgdesc="Locally installed user interface for LLMs, image generation, and TTS voice models"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/SillyTavern/$_pkgname"
license=('AGPL-3.0-only')
depends=('nodejs' 'perl')
makedepends=('npm' 'jq')
conflicts=('sillytavern-git')
backup=('usr/share/sillytavern/config.yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fd88cb8ecc918fb2bed1e392833e9c1819814a76be6a83f6c9a5ab3ab9a73437')

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
		#!/usr/bin/sh
		mkdir -p "\$HOME/.local/share/$pkgname"
		cd /usr/share/$pkgname && exec node /usr/share/$pkgname/server.js --dataRoot "\$HOME/.local/share/$pkgname" "\$@"
	EOF
}
