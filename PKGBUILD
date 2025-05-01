# Maintainer: Seth Hoong <hoong seth at gmail dot com>
pkgname=sillytavern-git
_pkgname=sillytavern
pkgver=1.12.13.r518.gb3a3b9d
pkgrel=1
pkgdesc="A locally installed user interface for LLMs, image generation, and TTS voice models"
arch=('x86_64')
url="https://github.com/SillyTavern/SillyTavern"
license=('AGPL-3.0-only')
groups=()
depends=('nodejs' 'perl' 'bash')
makedepends=('npm' 'jq' 'git')
conflicts=('sillytavern')
source=("$_pkgname::git+https://github.com/SillyTavern/SillyTavern.git#branch=staging")
noextract=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	export NODE_ENV=production

	(
		cd "$srcdir/$_pkgname"
		npm i --no-audit --no-fund --loglevel=error --no-progress --omit=dev
		mkdir -p "$pkgdir/usr/share"
		cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/$_pkgname"
	)

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/share/$_pkgname/package.json"

	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" > "$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Add script to run with correct options
	mkdir -p "$pkgdir/usr/bin"
	echo "#!/bin/sh" > "$pkgdir/usr/bin/$_pkgname"
	echo "mkdir -p \$HOME/.local/share/$_pkgname" >> "$pkgdir/usr/bin/$_pkgname"
	echo "( cd /usr/share/$_pkgname && node /usr/share/$_pkgname/server.js --dataRoot \$HOME/.local/share/$_pkgname \"\$@\" )" >> "$pkgdir/usr/bin/$_pkgname"
	chmod a+x "$pkgdir/usr/bin/$_pkgname"
}
