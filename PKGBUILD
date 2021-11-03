# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-null-ls-git
pkgver=r675.3c5cf2d
pkgrel=1
pkgdesc="Uses Neovim as a language server to inject diagnostics, code actions, and more"
arch=('any')
url="https://github.com/jose-elias-alvarez/null-ls.nvim"
license=('Unlicense')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'neovim-plenary' 'neovim-lspconfig')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=null-ls.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	sed -i '/packadd/d' test/minimal.vim
	echo "set rtp+=./" >> test/minimal.vim
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	find doc lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
