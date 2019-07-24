# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>

_npmname=instant-markdown-d
_npmver=0.1.0
pkgname=vim-instant-markdown
pkgver=0.1.1
pkgrel=4
pkgdesc="Instant Markdown previews from vim in a browser"
arch=(any)
license=(unknown)
url="https://github.com/suan/vim-instant-markdown#readme"
depends=('nodejs' 'npm' 'wget')
makedepends=('jq')
optdepends=('neovim: neovim support' 'vim: vim support')
source=("https://github.com/suan/$_npmname/archive/$pkgver.tar.gz"
        "https://github.com/suan/$pkgname/archive/v$_npmver.tar.gz")
noextract=($_npmver.tar.gz)
sha256sums=('806281d2499e1fe01d3827d75cc196c269fd65c6fe7313e99e0d0c3e70657c22'
            '7a3678f002e6f9760312ff82101dfd10d930251aad9b3fee53c76c2ca16a31c9')
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

	cp "$srcdir/$pkgname-$_npmver/after/ftplugin/markdown/instant-markdown.vim" "$pkgdir/usr/share/vim/vimfiles/after/ftplugin/markdown"
}

# vim: set ts=2 sw=2
