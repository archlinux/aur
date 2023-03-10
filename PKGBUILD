# Maintainer: mehalter <micah at mehalter.com>

_pkgname=astronvim
pkgname=${_pkgname}-git
pkgver=v3.0.1
pkgrel=1
pkgdesc="AstroNvim is an aesthetic and feature-rich neovim config that is extensible and easy to use with a great set of plugins"
arch=('any')
url="https://github.com/AstroNvim/AstroNvim"
license=('GPL3')
depends=("neovim>=0.8.0" "xclip")
source=("${pkgname}::git+${url}.git#branch=nightly" "astronvim.vim.template")
sha256sums=('SKIP' '0bb6cb6c0dce255d9b12f31db6c39c991b3b12ba2f0416466d4a7d4222ecde9f')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd ${pkgname}
	git describe --tags | sed 's/\(^v.*\)[-]\([^-]*-g\)/\1.r\2/;s/-/./g'
}

package() {
	cd "${srcdir}"
	install_dir="/usr/share/astronvim"
	echo -e "lua _G.astronvim_installation={home='${install_dir}', version='${pkgver}', is_stable=false}\n$(cat astronvim.vim.template)" >astronvim.vim
	install -Dm 644 "astronvim.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/astronvim.vim"
	cd "${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}${install_dir}"
	cp -r {init.lua,lua} "${pkgdir}${install_dir}"
}
