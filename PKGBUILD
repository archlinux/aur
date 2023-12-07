# Maintainer: hockeymikey <hockeymikey@hockeymikey.com>

_pkgname=nvchad
pkgname=${_pkgname}-git
pkgver=r1595.9d37797
pkgrel=1
pkgdesc="NvChad is a neovim config written in lua aiming to provide a base configuration with very beautiful UI and blazing fast startuptime."
arch=('any')
url="https://github.com/NvChad/NvChad"
license=('GPL3')
depends=("neovim>=0.7.0" "xclip")
source=("${pkgname}::git+${url}.git" "nvchad.vim.template")
sha256sums=('SKIP' '6b64e0f8bff887b6bed0822223a4acdfed682bee97d3aac73e7a2388e3b19d84')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"
	install_dir="/usr/share/nvchad"
	root_nvim_dir="/usr/share/nvim/runtime/"
	mkdir -p "${pkgdir}/usr/share/nvim/" && touch "${pkgdir}/usr/share/nvim/archlinux.vim"
	echo -e "$(cat nvchad.vim.template)" >> "${pkgdir}/usr/share/nvim/archlinux.vim"
	rm "${pkgdir}/usr/share/nvim/runtime/plugin/nvchad.vim" || true
	cd "${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}${install_dir}"
	mkdir -p "${pkgdir}${root_nvim_dir}"
	cp -r {init.lua,lua,.stylua.toml} "${pkgdir}${install_dir}"
	cp -rf {init.lua,lua,.stylua.toml} "${pkgdir}${root_nvim_dir}"
}
