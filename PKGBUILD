# Maintainer: Senan Kelly <senan@senan.xyz>
# Maintainer: Nogweii <packages@nogweii.net>
pkgname=nvim-treesitter-parsers-main-git
pkgver=r6181.77362027f
pkgrel=1
pkgdesc="All of the registered tree sitter parsers used by Neovim; main branch of nvim-treesitter"
arch=(x86_64)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=('Apache')
depends=('tree-sitter' 'neovim')
makedepends=('git' 'npm' 'tree-sitter-cli')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "nvim-treesitter-parsers" "nvim-treesitter-parsers-git")
_dirname="nvim-treesitter"
source=("${_dirname}::git+https://github.com/nvim-treesitter/nvim-treesitter#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_dirname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_dirname}"

	install_dir="$(pwd)/site"
	nvim -u NONE --headless --cmd "set rtp^=$(pwd)" -c "lua require('nvim-treesitter').setup({install_dir = \"$install_dir\"}); require('nvim-treesitter').install('all'):wait()" -c "q"
}

package() {
	cd "$srcdir/${_dirname}"

	parent_dir="$pkgdir/usr/share/nvim/site"

	mkdir -p "${parent_dir}/parser/"
	cp site/parser/*.so -t "${parent_dir}/parser/"

	mkdir -p "${parent_dir}/parser-info/"
	cp site/parser-info/*.revision -t "${parent_dir}/parser-info/"

	mkdir -p "${parent_dir}/queries/"
	cp -rL site/queries/* -t "${parent_dir}/queries/"
}
