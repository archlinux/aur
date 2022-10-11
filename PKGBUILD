# Maintainer: hockeymikey <hockeymikey@hockeymikey.com>

_pkgname=nvchad
pkgname=${_pkgname}-git
pkgver=r1399.dc66931
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
	echo -e "lua _G.nvchad_installation={home='${install_dir}', version='${pkgver}', is_stable=false}\n$(cat nvchad.vim.template)" >nvchad.vim
	install -Dm 644 "nvchad.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/nvchad.vim"
	cd "${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}${install_dir}"
	cp -r {init.lua,lua,.stylua.toml} "${pkgdir}${install_dir}"
}
