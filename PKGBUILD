# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lualine-git
pkgver=r511.385580e
pkgrel=2
pkgdesc="Lua-based statusline for Neovim"
arch=('any')
url="https://github.com/nvim-lualine/lualine.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
checkdepends=('neovim-plenary')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lualine.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$pkgname"
	## from make test
	nvim --headless --noplugin --clean -u lua/tests/minimal_init.lua \
		-c "lua require('plenary.test_harness').test_directory('lua/tests', \
		{ minimal_init = './lua/tests/minimal_init.lua' })"
}

package() {
	cd "$pkgname"
	find doc lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md THEMES.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
