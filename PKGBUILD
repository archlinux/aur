# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lsp_signature-git
pkgver=0.2.0.r39.g6f6252f
pkgrel=1
pkgdesc="Neovim plugin for showing LSP signature hints"
arch=('any')
url="https://github.com/ray-x/lsp_signature.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
checkdepends=('neovim-plenary')
provides=("${pkgname%-git}" 'neovim-lsp-signature')
conflicts=("${pkgname%-git}")
replaces=('neovim-lsp-signature-git')
install=lsp_signature.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	## do not run packadd
	sed -i '/vim.cmd/d' tests/signature_spec.lua
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	install -Dvm644 lua/lsp_signature/*.lua -t "$pkgdir/usr/share/nvim/runtime/lua/lsp_signature/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
