# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>

_npmname=instant-markdown-d
_npmver=0.1.0
pkgname=vim-instant-markdown
pkgver=0.1.0
pkgrel=9
pkgdesc="Instant Markdown previews from vim in a browser"
arch=(any)
license=(unknown)
url="https://github.com/suan/vim-instant-markdown#readme"
depends=('nodejs' 'npm' 'wget')
makedepends=('jq')
optdepends=('neovim: neovim support' 'vim: vim support')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
        "https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim")
noextract=($_npmname-$_npmver.tgz)
sha256sums=('457cda23129183b01a97e96de9e598680fa0cee6c7c9a40db0f830cd7031fa81'
            '317faf4a9d43504540b99e319c2ba5f0218458936109574d231b894ed772df6f')
install=install.sh

package() {
  mkdir -p "$pkgdir/usr/lib/node_modules/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/autoload/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/after/ftplugin/markdown"

	cd "$srcdir"
	npm install                    \
	  --global                     \
		--no-save                    \
		--production                 \
		--user   root                \
		--cache  "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr"       \
		"$_npmname-$_npmver.tgz"
	
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

	cp "$srcdir/instant-markdown.vim" "$pkgdir/usr/share/vim/vimfiles/after/ftplugin/markdown"
}

# vim: set ts=2 sw=2
