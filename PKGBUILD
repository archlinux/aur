# Maintainer: hockeymikey <hockeymikey@hockeymikey.com>

_pkgname=nvchad
pkgname=${_pkgname}-git
pkgver=r1700.4a2cefa5
pkgrel=1
pkgdesc="NvChad is a neovim config written in lua aiming to provide a base configuration with very beautiful UI and blazing fast startuptime."
arch=('any')
url="https://github.com/NvChad/NvChad"
license=('GPL3')
depends=("neovim>=0.7.0" "xclip")
source=("nvchad::git+${url}.git" "starter::git+https://github.com/NvChad/starter" "nvchad.vim.template")
sha256sums=('SKIP' 'SKIP' '030ba362f0f362ae7e7b43d6c32c5f9f660d67877c96fd1302f310538c2ae357')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd nvchad
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install_dir="/usr/share/nvchad"
	root_nvim_dir="/usr/share/nvim/runtime/"
	mkdir -p "${pkgdir}/usr/share/nvim/" && touch "${pkgdir}/usr/share/nvim/archlinux.lua"
	echo -e "$(cat nvchad.vim.template)" >> "${pkgdir}/usr/share/nvim/archlinux.lua"
	rm "${pkgdir}/usr/share/nvim/runtime/plugin/nvchad.vim" || true
	cd "nvchad"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd ..
	mkdir -p "${pkgdir}${install_dir}"
	mkdir -p "${pkgdir}${root_nvim_dir}"
	cd starter
	cp -r {init.lua,lua,.stylua.toml} "${pkgdir}${install_dir}"
	cp -rf {init.lua,lua,.stylua.toml} "${pkgdir}${root_nvim_dir}"
}
