# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Contributor: Seth Hoong <hoong seth at gmail dot com>

pkgname=sillytavern
_pkgname=SillyTavern
pkgver=1.19.1
pkgrel=1
pkgdesc="Locally installed user interface for LLMs, image generation, and TTS voice models"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SillyTavern/$_pkgname"
license=('AGPL-3.0-only')
depends=('nodejs')
makedepends=('npm' 'jq')
conflicts=('sillytavern-git')
options=('!strip' '!debug')
install=sillytavern.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('6f234727c5409160be6d64c2047d80943b303f50b0a8c6ee05735d7f3ed2716b2879845fc73ea0e8fa17c90a309b8722c1e73c24903d61f9b0fb83338cc94ec3')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm ci --cache="$srcdir/npm-cache" --omit=dev --ignore-scripts
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm rebuild --cache="$srcdir/npm-cache"
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
		_config_dir="\${XDG_CONFIG_HOME:-\$HOME/.config}/$pkgname"
		_data_dir="\${XDG_DATA_HOME:-\$HOME/.local/share}/$pkgname"
		mkdir -p "\$_config_dir" "\$_data_dir"
		cd /usr/share/$pkgname && exec node /usr/share/$pkgname/server.js --dataRoot "\$_data_dir" --configPath "\$_config_dir/config.yaml" "\$@"
	EOF
}
