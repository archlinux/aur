# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=nerdtree-git-plugin-git
_pkgname="${pkgname%-git}"
pkgver=r149.e1fe727
pkgrel=1
pkgdesc="A plugin of NERDTree showing git status"
url="https://github.com/Xuyuanp/nerdtree-git-plugin"
arch=('any') 
license=('LicenseRef-WTFPL')
depends=('git' 'vim-nerdtree')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        rollback_git_status-vim.patch)
sha256sums=('SKIP'
            '4473fbe1c91e1cf19f7b7362517ae32be7acdb2eb45baa348b7025938b681095')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"

	# Rollback the git_status.vim to a state where it is now working
	# (git_status.vim in current HEAD/main is severely broken)
	patch -Np1 < "${srcdir}/rollback_git_status-vim.patch"
}

package() {
	cd "${_pkgname}"

	install -Dm 644 nerdtree_plugin/git_status.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/git_status.vim"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
