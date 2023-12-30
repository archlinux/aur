# Maintainer: Alfredo Ramos <alfredo.ramos@skiff.com>

_binname=asdf
_pkgname=${_binname}-vm
pkgname=${_pkgname}-git
pkgver=0.10.1.1.g0bc8c3a
pkgrel=1
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more. Git version.'
arch=('any')
url='https://asdf-vm.com'
license=('MIT')
depends=('git' 'curl')
makedepends=('txt2man')
optdepends=(
	'ncurses: For terminal handling'
	'bash-completion: For Bash completion'
	'unzip: For Elixir plugin'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=${_pkgname}.install

source=("git+https://github.com/${_pkgname}/${_binname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_binname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

build() {
	cd "${srcdir}"/${_binname}
	txt2man -t "${_pkgname}" -v "${pkgname}" -r "${pkgver}" help.txt > ${_binname}.1
}

package() {
	cd "${srcdir}"/${_binname}

	# Core
	mkdir -p "${pkgdir}"/opt/${_pkgname}
	cp -a {bin,lib} "${pkgdir}"/opt/${_pkgname}/
	cp -a asdf.{sh,fish,elv} "${pkgdir}"/opt/${_pkgname}/
	cp -a {defaults,help.txt,version.txt} "${pkgdir}"/opt/${_pkgname}/

	# Shell completions
	mkdir -p "${pkgdir}"/usr/share/{,bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
	cp -a completions/asdf.bash "${pkgdir}"/usr/share/bash-completion/completions/
	cp -a completions/asdf.fish "${pkgdir}"/usr/share/fish/vendor_completions.d/
	cp -a completions/_asdf "${pkgdir}"/usr/share/zsh/site-functions/

	# Man page
	mkdir -p "${pkgdir}"/usr/share/man/man1
	cp -a ${_binname}.1 "${pkgdir}"/usr/share/man/man1/

	# License
	mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
	cp -a LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}