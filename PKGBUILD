# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Alex Gentilucci <alexander.gentilucci@gmail.com>

_npmname=instant-markdown-d
_npmver=0.3.0
pkgname=vim-instant-markdown
pkgver=0.3.0
pkgrel=2
pkgdesc="Instant Markdown previews from vim in a browser"
arch=(any)
license=(Apache)
url="https://github.com/instant-markdown/vim-instant-markdown"
depends=('nodejs' 'npm' 'wget' 'xdg-utils' 'curl')
makedepends=('jq')
optdepends=('neovim: neovim support' 
						'vim: vim support')
source=("https://github.com/instant-markdown/$_npmname/archive/$pkgver.tar.gz"
        "https://github.com/instant-markdown/$pkgname/archive/v$_npmver.tar.gz")
noextract=($_npmver.tar.gz)
sha256sums=('22ecc56d63b1810f84383f206fb3b8f165a7942cb1771b2bfb0223693c9d0212'
            '02193901308c894639976afa01331608dd46697a0c14dcb360b25679052f336a')
install=install.sh

package() {
  mkdir -p "$pkgdir/usr/lib/node_modules/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/autoload/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/ftplugin/markdown"

	cd "$srcdir"
	npm install                    \
	 	--global                     \
		--no-save                    \
		--production                 \
		--user   root                \
		--cache  "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr"       \
		"$pkgver.tar.gz"
	
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
 	chmod 644 "$pkgjson"

	cp "$srcdir/$pkgname-$_npmver/ftplugin/markdown/instant-markdown.vim" "$pkgdir/usr/share/vim/vimfiles/ftplugin/markdown"
}

