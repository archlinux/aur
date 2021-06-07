# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-tree-sitter-git
pkgver=r1398.37ed50f
pkgrel=1
pkgdesc="Neovim tree-sitter configurations and abstraction layer"
arch=('any')
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim-git' 'tree-sitter')
makedepends=('git')
optdepends=('tree-sitter-grammars')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url"
        'no_install.patch')
sha256sums=('SKIP'
            '5531574b77217a2766626ef2c05dac307e650dc830a613bada297e17abcb3e3c')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	## Patching out install/uninstall functionality as this will be resolved with
	## tree-sitter-language packages
	patch -p1 < "$srcdir/no_install.patch"
}

package() {
	cd "$pkgname"
	find after autoload doc ftdetect lua parser-info parser plugin queries \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
