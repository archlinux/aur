# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=graphite-cli
pkgname=$_npmname
pkgver=1.7.13
pkgrel=1

pkgdesc="Graphite helps you create smaller pull requests, stay unblocked, and ship faster."
arch=(any)
url="https://graphite.dev/"
license=("None")

depends=("nodejs")
makedepends=("npm" "jq")
# provides=("$_npmname")
# conflicts=("$_npmname")

changelog="changelog.md"

source=("https://registry.npmjs.org/@withgraphite/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('d84dc682181724aef7862186c9c406cc1d41a5fd0bc0bf7d922951194fedaf286413075dd2045628f20c75ab08b8c54a626915c07bbd8ca59bedc5e7f1e404b4')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/@withgraphite/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	#
	# taken from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=graphite-cli-git

	# graphite uses the values in the SHELL and ZSH_NAME environmental variables to detect which shell it is running within
	# when generating completions
	SHELL=bash node $pkgdir/usr/bin/graphite completion >"$srcdir/pre-bash-graphite-completions"
	SHELL=zsh node $pkgdir/usr/bin/graphite completion >"$srcdir/pre-zsh-graphite-completions"

	# make the completion script suitable to be a loadable function
	sed 's/compdef _index.js_yargs_completions index.js/_index.js_yargs_completions/' -i "$srcdir/pre-zsh-graphite-completions"

	# make it so autocompletion works for both graphite and gt on both zsh and bash

	sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/graphite/g' "$srcdir/pre-bash-graphite-completions" >"$srcdir/bash-graphite-completions"
	sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/gt/g' "$srcdir/pre-bash-graphite-completions" >"$srcdir/bash-gt-completions"
	sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/graphite/g' "$srcdir/pre-zsh-graphite-completions" >"$srcdir/zsh-graphite-completions"
	sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/gt/g' "$srcdir/pre-zsh-graphite-completions" >"$srcdir/zsh-gt-completions"

	install -Dm 644 "$srcdir/bash-graphite-completions" "$pkgdir/usr/share/bash-completion/completions/graphite"
	install -Dm 644 "$srcdir/bash-gt-completions" "$pkgdir/usr/share/bash-completion/completions/gt"
	install -Dm 644 "$srcdir/zsh-graphite-completions" "$pkgdir/usr/share/zsh/site-functions/_graphite"
	install -Dm 644 "$srcdir/zsh-gt-completions" "$pkgdir/usr/share/zsh/site-functions/_gt"
	install -Dm 644 "$pkgdir/usr/lib/node_modules/@withgraphite/graphite-cli/gt.fish" "$pkgdir/usr/share/fish/completions/gt.fish"
}
