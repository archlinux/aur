# Maintainer: Nogweii <packages@nogweii.net>
pkgname=nvim-treesitter-parsers-git
pkgver=r1310.8996612b
pkgrel=2
pkgdesc="All of the registered tree sitter parsers used by Neovim"
arch=(x86_64)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=('Apache')
depends=('tree-sitter' 'neovim')
makedepends=('git' 'npm') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_dirname="nvim-treesitter"
source=("${_dirname}::git+https://github.com/nvim-treesitter/nvim-treesitter")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_dirname}"
	# I want to get the version not of the entire repo, but just the lockfile.json file
	lockfile_commits_count="$(git rev-list --count HEAD -- lockfile.json)"
	lockfile_latest_commit="$(git rev-list -1 HEAD lockfile.json)"
	shortend_commit="$(git rev-parse --short "${lockfile_latest_commit}")"

	echo "r${lockfile_commits_count}.${shortend_commit}"
}

build() {
	cd "$srcdir/${_dirname}"
	nvim -u NONE --headless --cmd "set rtp+=$(pwd)" -c "lua require('nvim-treesitter').setup()" -c "TSInstallSync all" -c "q"
}

package() {
	cd "$srcdir/${_dirname}"
	parent_dir="$pkgdir/usr/lib/nvim"

	mkdir -p "${parent_dir}/parser/"
	cp parser/*.so -t "${parent_dir}/parser/"

	mkdir -p "${parent_dir}/parser-info/"
	cp parser-info/*.revision -t "${parent_dir}/parser-info/"

	mkdir -p "${parent_dir}/queries/"
	cp -r queries/* -t "${parent_dir}/queries/"
}
